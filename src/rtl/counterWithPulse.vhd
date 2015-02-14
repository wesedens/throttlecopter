
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use WORK.ALL;



entity counterWithPulse is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           MaxCounter : in  unsigned(27 downto 0);
           Pulse : out  STD_LOGIC);
end counterWithPulse;

architecture Behavioral of counterWithPulse is

signal cntr: unsigned(27 downto 0);
signal syncReset: std_logic;

begin

-- Creates a pulse when Max Counter is reached
process(clk, reset)
begin
	if(reset='1')then
		cntr <= (others=>'0');
	elsif(rising_edge(clk)) then
		if(syncReset = '1') then
			cntr <= (others => '0');
		else 
			cntr <= cntr + 1;
		end if;
	end if;
end process;

syncReset <= '1' when (cntr = MaxCounter) else '0';
Pulse <= syncReset;


end Behavioral;

