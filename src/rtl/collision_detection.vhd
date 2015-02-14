----------------------------------------------------------------------------------
-- Engineer:  Gary Crum
--
-- Create Date:    15:14:40 04/15/2011
--
-- Module Name:    collision_detection - Behavioral
--
-- If the pixel is active for the copter and either the cave or obstacle then there  is a collision
-- the collision flag will remain until game_restart is set to 1 (and released).
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity collision_detection is
    Port (
        clk              : in  STD_LOGIC;
        rst              : in  STD_LOGIC;
        game_restart     : in  STD_LOGIC;
        copter_active    : in  STD_LOGIC;
        cave_active      : in  STD_LOGIC;
        obstacle_active  : in  STD_LOGIC;
        collision        : out STD_LOGIC
    );
end collision_detection;

architecture Behavioral of collision_detection is

  signal collision_current : std_logic;
  signal collision_last    : std_logic;
  signal collision_found   : std_logic;

begin

    process(clk, rst)
    begin
        if(rst = '1') then
            collision_current <= '0' ;
            collision_last    <= '0' ;
            collision_found   <= '0';
        elsif(rising_edge(clk))then
            if(game_restart = '1') then
                collision_found <= '0';
            end if;

            --if we are not all ready in a collision
            if(collision_found = '0') then
                collision_current <= (copter_active and cave_active) or (copter_active and obstacle_active) ;
                collision_last    <= collision_current;

                --edge detect
                if(collision_last = '0' and collision_current = '1') then
                    collision_found <= '1';
                end if;

            end if;
        end if;
    end process;

    collision <= collision_found;

end Behavioral;

