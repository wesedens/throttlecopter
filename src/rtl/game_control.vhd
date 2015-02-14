----------------------------------------------------------------------------------
-- Engineer:  Gary Crum
--
-- Create Date:    15:56:24 04/15/2011
-- Module Name:    game_control - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity game_control is
Port (
    clk                  : in  STD_LOGIC;
    rst                  : in  STD_LOGIC;
    output_off           : out STD_LOGIC;
    throttle             : in  STD_LOGIC;
    collision_in         : in  STD_LOGIC;
    speed_in             : in  STD_LOGIC_VECTOR(3 downto 0);
    speed_out            : out STD_LOGIC_VECTOR(3 downto 0);
    update_scene         : out STD_LOGIC;
    collision            : out STD_LOGIC;
    display_start_screen : out STD_LOGIC;
    game_in_progress     : out STD_LOGIC
);
end game_control;

architecture Behavioral of game_control is


-- State Machine Definitions
TYPE GAME_STATE_TYPE IS
(
  S_IDLE,
  S_SETUP_1,
  S_WAIT_FOR_GAME_START,
  S_GAME_IN_PROGRESS,
  S_DISPLAY_END,
  S_WAIT_END_ACK,
  S_WAIT_END_ACK_2
);

SIGNAL GAME_STATE         : GAME_STATE_TYPE;
SIGNAL end_counter        : unsigned(31 downto 0);
SIGNAL rst_pulse_gen      : std_logic;
SIGNAL update_scene_int   : std_logic;
SIGNAL setup_update_scene : std_logic;

begin

  speed_out     <= speed_in;
  update_scene <= update_scene_int or setup_update_scene;

  pulse_25MHz_gen : ENTITY work.pulse_gen
  GENERIC MAP(
    C_RESET_LEVEL         => '1',
    C_CLK_PERIOD_NS       => 20,
    C_PULSE_PERIOD_NS     => 15728640
  )
  PORT MAP(
    clk                   => clk,
    reset                 => rst_pulse_gen,
    pulse_out             => update_scene_int
  );

	process(clk, rst)
	begin
		if(rst = '1') then
			end_counter 		 <= (OTHERS => '0');
			rst_pulse_gen 		 <= '1';
			GAME_STATE     		 <= S_IDLE;
			display_start_screen <= '1';
			game_in_progress 	 <= '0';
			output_off           <= '1';
		elsif(rising_edge(clk)) then
			output_off           <= '0';
			setup_update_scene   <= '0';
			display_start_screen <= '0';

			case GAME_STATE is
				when S_IDLE =>
				    display_start_screen <= '1';
					output_off           <= '1';
					setup_update_scene   <= '1';
					GAME_STATE     		 <= S_SETUP_1;
				when S_SETUP_1 =>
					output_off 			<= '1';
					setup_update_scene  <= '1';
					GAME_STATE     		<= S_WAIT_FOR_GAME_START;
                    end_counter         <= (OTHERS => '0');
				    rst_pulse_gen       <= '1';

				when S_WAIT_FOR_GAME_START =>
					if(throttle = '1') then
						GAME_STATE <= S_GAME_IN_PROGRESS;
					end if;

				when S_GAME_IN_PROGRESS =>
					game_in_progress <= '1';
					rst_pulse_gen    <= '0';
					if(collision_in = '1') then
						GAME_STATE <= S_DISPLAY_END;
					end if;

				when S_DISPLAY_END =>
					game_in_progress <= '0';
					rst_pulse_gen    <= '1';
					if(end_counter = to_unsigned(80000000,end_counter'length)) then
						GAME_STATE <= S_WAIT_END_ACK;
					end if;
					end_counter <= end_counter + 1;

				when S_WAIT_END_ACK =>
					if(throttle = '1') then
						GAME_STATE <= S_WAIT_END_ACK_2;
					end if;

				when S_WAIT_END_ACK_2 =>
					if(throttle = '0') then
						GAME_STATE <= S_IDLE;
					end if;

				when others =>
					GAME_STATE <= S_IDLE;

			end case;
		end if;
	end process;

end Behavioral;

