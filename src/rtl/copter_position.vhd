----------------------------------------------------------------------------------
-- Engineer:  Gary Crum
--
-- Create Date:    11:59:20 04/15/2011
--
-- Module Name:    copter_position - Behavioral
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity copter_position is
Port (
    clk         : in  STD_LOGIC;
    rst         : in  STD_LOGIC;
    enable      : in  STD_LOGIC;
    game_restart: in  STD_LOGIC;
    throttle 	: in  STD_LOGIC;
    up_down_n   : out STD_LOGIC;
    copter_pos_x: out unsigned(9 downto 0);
    copter_pos_y: out unsigned(9 downto 0)
);
end copter_position;

architecture Behavioral of copter_position is

    signal  copter_pos_x_int: unsigned(9 downto 0);
    signal  copter_pos_y_int: unsigned(9 downto 0);
    signal  en_throttle     : std_logic;
    signal  up_down_n_int   : std_logic;

begin

  --assign the output ports
  copter_pos_x <= copter_pos_x_int;
  copter_pos_y <= copter_pos_y_int;
  up_down_n    <= up_down_n_int;


  -- Need to 'slow' down the throttle/position update
  pulse_25MHz_gen : ENTITY work.pulse_gen
  GENERIC MAP(
    C_RESET_LEVEL         => '1',
    C_CLK_PERIOD_NS       => 20,
    C_PULSE_PERIOD_NS     => 10485740
  )
  PORT MAP(
    clk                   => clk,
    reset                 => rst,
    pulse_out             => en_throttle
  );


  -- Main process
  -- if throttle is enable - from clock enable above
  --  move up or down based on user input
  --  protect from going off screen (too far up/down)
  -- Keep Track of the current up/down state for use in the copter gen
  -- On a Game Restart - move back to center
  process(clk, rst)
  begin
    if(rst = '1') then
        up_down_n_int    <= '0';
        copter_pos_x_int <= to_unsigned(0,copter_pos_x_int'length);
        copter_pos_y_int <= to_unsigned(230,copter_pos_y_int'length);
    elsif(rising_edge(clk)) then
        if(game_restart = '1') then
            up_down_n_int    <= '0';
            copter_pos_x_int <= to_unsigned(0,copter_pos_x_int'length);
            copter_pos_y_int <= to_unsigned(230,copter_pos_y_int'length);
        else
            up_down_n_int <= up_down_n_int ;
            if(enable = '1') then
                if (en_throttle = '1') then
                    if(throttle = '1') then
                        -- check for max - can't go past it
                        if(copter_pos_y_int /= to_unsigned(0,10)) then
                            copter_pos_y_int <= copter_pos_y_int - 1;
                            up_down_n_int   <= '1';
                        end if;
                    else
                        -- check for min- can't go past it
                        if(copter_pos_y_int /= to_unsigned(480-20,10)) then
                            copter_pos_y_int <= copter_pos_y_int + 1;
                            up_down_n_int    <= '0';
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end if;
  end process;

end Behavioral;

