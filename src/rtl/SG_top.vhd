--Scene Generator
--By David DeTomaso

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity SG_top is
			port(	clk: 	in std_logic;
					rst: 	in std_logic;
					enable       : std_logic;
					game_restart : in std_logic;

   				sliderSwitches: in std_logic_vector(3 downto 0);
					update_img:	in  std_logic;
					
					pixel_x:		in unsigned(9 downto 0);
					pixel_y:		in unsigned(9 downto 0);
					
					pixelActive: out std_logic;
					pixelRed:	out std_logic_vector(2 downto 0);
					pixelGreen:	out std_logic_vector(2 downto 0);
					pixelBlue:	out std_logic_vector(1 downto 0)
					);
end SG_top;

architecture Behavioral of SG_top is

signal address	     :	std_logic_vector(9 downto 0);
signal write_address: std_logic_vector(9 downto 0);
signal read_address : std_logic_vector(9 downto 0);

signal data_in	:	std_logic_vector(63 downto 0);
signal data_out:	std_logic_vector(63 downto 0);
signal wea		:	std_logic_vector(0 downto 0);

signal pixels_out:	unsigned(63 downto 0);
signal offset:		unsigned(9 downto 0);
signal above_top:	std_logic;
signal equal_top: std_logic;
signal below_bottom:	std_logic;
signal equal_bottom: std_logic;
signal in_cave_edge: std_logic;
signal in_cave:		std_logic;
signal lt_block:	std_logic;
signal gb_block:	std_logic;
signal in_block:	std_logic;
signal active:		std_logic;
signal we:			std_logic;

signal out_rgb:	std_logic_vector(7 downto 0);
signal cave_color: std_logic_vector(7 downto 0);
signal cave_edge_color: std_logic_vector(7 downto 0);
signal block_color: std_logic_vector(7 downto 0);

COMPONENT circ_buffer IS
	port (
	clka: in std_logic;
	wea: in std_logic_vector(0 downto 0);
	addra: in std_logic_vector(9 downto 0);
	dina: in std_logic_vector(63 downto 0);
	douta: out std_logic_vector(63 downto 0));
END COMPONENT;

signal rst_int : std_logic;
signal col_pulse : std_logic;
begin

rst_int <= rst or game_restart;

wea(0) <= we; --for some reason the buffer wanted a vector for the write enable
scene_memory	:	 circ_buffer port map(ADDRA => address,
															DINA => data_in,
															WEA => wea,
															CLKA => clk,
															DOUTA => data_out);

--Mux address input depending on operation
address <= write_address when (we = '1') else read_address;



--Read Path
read_address <= std_logic_vector(pixel_x + offset);
pixels_out   <= unsigned(data_out);-- when (readout = '1') else (others => '0');
above_top    <= '1' when (pixel_y  <= pixels_out(63 downto 54)) else '0';
equal_top    <= '1' when (pixel_y   = pixels_out(63 downto 54)) else '0';
below_bottom <= '1' when(pixel_y   >= pixels_out(41 downto 32)) else '0';
equal_bottom <= '1' when(pixel_y    = pixels_out(41 downto 32)) else '0';
lt_block     <= '1' when(pixel_y   >= pixels_out(19 downto 10)) else '0';
gb_block     <= '1' when(pixel_y   <= pixels_out(9 downto 0))   else '0'; 

in_block <= lt_block AND gb_block;
in_cave_edge <= equal_top OR equal_bottom;
in_cave <= above_top OR below_bottom;

active <= in_block OR above_top OR below_bottom;

cave_color <= "00100101";
cave_edge_color <= "00001111";
block_color <= "11001001";


out_rgb <= cave_edge_color when (in_cave_edge = '1') else cave_color when (in_cave = '1') else block_color when (in_block = '1') else "00000000";
--Buffer outputs
process(clk)
begin
	if(rst_int = '1') then
		pixelActive <= '0';
		pixelRed <= "000";
		pixelGreen <= "000";
		pixelBlue <= "00";
	elsif(rising_edge(clk)) then
			pixelActive <= active;
			pixelRed    <= out_rgb(7 downto 5);
			pixelGreen  <= out_rgb(4 downto 2);
			pixelBlue  <= out_rgb(1 downto 0);
	end if;
end process;

col_pulse <= update_img;-- or game_restart;
--Column Writer
colwrite	:	entity ColumnWriter port map(clk 			   => clk,
														rst 			   => rst_int,
														game_restart   => game_restart,
														sliderSwitches => sliderSwitches,
														pulse_in 		=> col_pulse,
														data_out       => data_in,
														we             => we,
														address_out    => write_address,
														offset_out     => offset);

end Behavioral;

