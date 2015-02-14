----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:32:39 04/18/2011 
-- Design Name: 
-- Module Name:    ColumnWriter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.all;

entity ColumnWriter is
				port(	clk: in std_logic;
						rst: in std_logic;
						game_restart : in std_logic;
						pulse_in: in std_logic;
						sliderSwitches: in std_logic_vector(3 downto 0);
						data_out: out std_logic_vector(63 downto 0);
						we:		out std_logic;
						address_out:	out std_logic_vector(9 downto 0);
						offset_out:	out unsigned(9 downto 0));
end ColumnWriter;

architecture Behavioral of ColumnWriter is
type states is (PreStart, Start, S2, S3, S4, S5, Waiting);
signal state: states := PreStart;
signal offset: unsigned(9 downto 0);
signal address: unsigned(9 downto 0);
signal to_add: unsigned(9 downto 0);

signal slope: std_logic_vector(11 downto 0);
signal add_slope: unsigned(21 downto 0);
signal slope_ctdn: unsigned(7 downto 0);

signal block_ctdn: unsigned(9 downto 0);
signal block_top:	 unsigned(9 downto 0);
signal block_top_out: unsigned(9 downto 0);
signal block_bottom: unsigned(9 downto 0);
signal block_bottom_out: unsigned(9 downto 0);
signal blk_en: std_logic;

signal previous_top: unsigned(21 downto 0);
signal previous_bottom: unsigned(21 downto 0);

--signals for LSFR
signal new_slope_en: std_logic;
signal write_lsfr_en: std_logic;
signal write_lsfr_bits: std_logic_vector(11 downto 0);
signal new_slope:	std_logic_vector(11 downto 0);

--signals for jagged_LSFR
signal jagged_en: std_logic;
signal jagged_write: std_logic;
signal jagged_in_bits: std_logic_vector(11 downto 0);
signal jagged_out: std_logic_vector(11 downto 0);

--signals for block LSFR
signal block_lsfr_en: std_logic;
signal write_block_lsfr: std_logic;
signal start_block_bits: std_logic_vector(11 downto 0);
signal new_block_lsfr: std_logic_vector(11 downto 0);
signal game_restart_delay :std_logic;
begin


address 				<= offset + 640;
address_out 		<= std_logic_vector(address);
we 					<= '1' when(state = S4) else '0'; --only enable write when in S4 state
blk_en 				<= '1' when(block_ctdn <= 40) else '0'; -- enables display of the block for 40 pixels
block_top_out 		<= block_top when (blk_en = '1') else "1111111111";
block_bottom_out 	<= block_bottom when (blk_en = '1') else "0000000000";
data_out 			<= (std_logic_vector(previous_top) & std_logic_vector(previous_bottom)
					    & std_logic_vector(block_top_out) & std_logic_vector(block_bottom_out));
offset_out 			<= offset;
add_slope 			<= unsigned( (9 downto 0 => slope(11)) & (slope));

rand_slope : entity LSFR_12
	port map(clk => clk,
				en => new_slope_en,
				we => write_lsfr_en,
				in_bits => write_lsfr_bits,
				out_bits => new_slope);
				
jaggedy_stuff: entity LSFR_12
	port map(clk => clk,
				en => jagged_en,
				we => jagged_write,
				in_bits => jagged_in_bits,
				out_bits => jagged_out);

rand_block : entity LSFR_12
	port map(clk => clk,
				en => block_lsfr_en,
				we => write_block_lsfr,
				in_bits => start_block_bits,
				out_bits => new_block_lsfr);
				
--State machine for block LSFR
process(clk)
begin
if(rising_edge(clk)) then
	case state is
	when PreStart =>
			block_lsfr_en <= '1';
			write_block_lsfr <= '1';
			start_block_bits <= "001100000010";
	when Start =>
			block_lsfr_en <= '0';
			write_block_lsfr <= '0';
			block_ctdn <= to_unsigned(340,block_ctdn'length);
	when S2 =>
		write_block_lsfr <= '0';
		if (block_ctdn = 41) then
			block_top <=     previous_top(21 downto 12) + unsigned("00" & new_block_lsfr(7 downto 0));
			block_bottom <=  previous_top(21 downto 12) + unsigned("00" & new_block_lsfr(7 downto 0)) + 50;
		end if;
		if(block_ctdn = 0) then
			block_lsfr_en <= '1';
			block_ctdn <= to_unsigned(340,block_ctdn'length);
		else
			block_lsfr_en <= '0';
			block_ctdn <= block_ctdn - 1;
		end if;
	when others =>
			write_block_lsfr <= '0';
			block_lsfr_en <= '0';
	end case;
end if;
end process;



--State machine for jagged LSFR
process(clk)
begin
if(rising_edge(clk)) then
	case state is
	when PreStart =>
				jagged_en <= '1';
				jagged_write <= '1';
				jagged_in_bits <= "001101101001";
	when Start =>
				jagged_en <= '0';
				jagged_write <= '0';
	when S2 =>
				jagged_en <= '1';
				jagged_write <= '0';
	when others =>
				jagged_en <= '0';
				jagged_write <= '0';
	end case;
end if;
end process;



--State machine for slope LSFR
process(clk)
begin
if(rising_edge(clk)) then
	case state is
	when PreStart =>
		write_lsfr_en <= '1';
		write_lsfr_bits <= "111011111111";
		new_slope_en <= '1';
	when Start =>
		slope <= "000100000000";
		slope_ctdn <= "10000000"; -- 128
	when S2 =>
		--Handle new slope condition
		write_lsfr_en <= '0';
		if(slope_ctdn = "00000000") then
			slope_ctdn <= "10000000";	--reset for next slope
			slope <= new_slope;
			new_slope_en <= '1';
		else
			new_slope_en <= '0';
			slope_ctdn <= slope_ctdn - 1;	
		end if;
	when S4 =>
		--Rebound off the ceiling or floor so we don't get out of the map!
		write_lsfr_en <= '0';
		new_slope_en <= '0';
		if((previous_top(21 downto 12) < 30) or (previous_bottom(21 downto 12) > 450)) then
			slope <= not slope; --approx * -1
		end if;
	when Waiting =>
		if(rst = '1') then
			write_lsfr_en <= '1';
			write_lsfr_bits <= jagged_out;
			new_slope_en <= '1';
		else
			write_lsfr_en <= '0';
			new_slope_en <= '0';
		end if;
	when others =>
		write_lsfr_en <= '0';
		new_slope_en <= '0';
	end case;
end if;
end process;


process(clk)
begin
if(rising_edge(clk)) then
			case state is
			when PreStart => --for the Very first time!
				if(pulse_in = '1') then
					state <= Start;
				else
					state <= PreStart;
				end if;
			when Start =>	--Initialize all values
					offset <= "0110000000"; --384
					to_add <= "1010000000"; --639
					previous_top <= "0001100100000000000000"; -- 100
					previous_bottom <= "0101111100000000000000"; -- 380
					state <= S2;
			when S2 =>
				--Shrink Cavern
				previous_top <= previous_top + to_unsigned(16,previous_top'length);
				previous_bottom <= previous_bottom - to_unsigned(16,previous_bottom'length);
			
				--Handle new block condition
				state <= S3;
				
			when S3 => --calculate new top and bottom
				previous_top <= previous_top + add_slope;
				previous_bottom <= previous_bottom + add_slope;
				state <= S4;
				
			when S4 => --prepare to write new values
				to_add <= to_add - 1;
				state <= S5;
				
			when S5 => -- iterate or complete?
				previous_top <= previous_top + unsigned((6 downto 0 => jagged_out(11)) & jagged_out & (2 downto 0 => jagged_out(11)));
				previous_bottom <= previous_bottom + unsigned((6 downto 0 => jagged_out(11)) & jagged_out & (2 downto 0 => jagged_out(11)));
				offset <= offset + 1; -- handle this here instead of S4
				if(to_add = "0000000000") then
					state <= Waiting;
				else
					state <= S2;
				end if;
				
			when Waiting => --Begin the loop, speed is set here
				if(pulse_in = '1') then
					to_add <= unsigned((5 downto 0 => '0') & sliderSwitches)+1;  --Add this many columns per frame
					if(rst = '0') then
					state <= S2;
					else
					state <= Start;
					end if;
				else
					state <= Waiting; --wait for pulse to add cols
				end if;
			end case;
		end if;
end process;

		



end Behavioral;

