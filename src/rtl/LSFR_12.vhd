----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:05 04/30/2011 
-- Design Name: 
-- Module Name:    LSFR_12 - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LSFR_12 is
port( clk: in std_logic;
		en:	in std_logic;
		we:	in std_logic;
		in_bits: in std_logic_vector(11 downto 0);
		out_bits: out std_logic_vector(11 downto 0));
end LSFR_12;

architecture Behavioral of LSFR_12 is
signal lsfr: std_logic_vector(11 downto 0);
begin

process(clk)
begin
	if(rising_edge(clk)) then
		if(en = '1') then
			if(we = '0') then
					lsfr(1) <= lsfr(0);
					lsfr(2) <= lsfr(1);
					lsfr(3) <= lsfr(2);
					lsfr(4) <= lsfr(3);
					lsfr(5) <= lsfr(4);
					lsfr(6) <= lsfr(5);
					lsfr(7) <= lsfr(6);
					lsfr(8) <= lsfr(7);
					lsfr(9) <= lsfr(8);
					lsfr(10) <= lsfr(9);
					lsfr(11) <= lsfr(10);
					lsfr(0) <= (((lsfr(11) xor lsfr(10)) xor lsfr(9)) xor lsfr(3));
			else
					lsfr(0) <= in_bits(0);
					lsfr(1) <= in_bits(1);
					lsfr(2) <= in_bits(2);
					lsfr(3) <= in_bits(3);
					lsfr(4) <= in_bits(4);
					lsfr(5) <= in_bits(5);
					lsfr(6) <= in_bits(6);
					lsfr(7) <= in_bits(7);
					lsfr(8) <= in_bits(8);
					lsfr(9) <= in_bits(9);
					lsfr(10) <= in_bits(10);
					lsfr(11) <= in_bits(11);
			end if;
		end if;
	end if;
end process;

out_bits <= lsfr;

end Behavioral;

