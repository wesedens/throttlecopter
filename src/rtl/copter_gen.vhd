----------------------------------------------------------------------------------
-- Engineer:  Gary Crum
--
-- Create Date:    10:34:30 04/15/2011
--
-- Module Name:    copter_position - Behavioral
---------------------------------------------------------------------------------
-- Notes on the Coordinates
--  x,y start in top left
--  0,0    1,0    2,0    3,0 ...  480,0
--  0,1
--  0,2
--   .
--   .
--   .
--  0,640                ......  480,640
--
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity copter_gen is
Port (
    clk         : in   STD_LOGIC;
    rst         : in   STD_LOGIC;
    up_down_n   : in   STD_LOGIC;  --1 if going up, 0 if going down
    copter_pos_x: in   unsigned(9 downto 0);
    copter_pos_y: in   unsigned(9 downto 0);
    pixel_x     : in   unsigned(9 downto 0);
    pixel_y     : in   unsigned(9 downto 0);
    pixelRed    : out  std_logic_vector(2 downto 0);
    pixelGreen  : out  std_logic_vector(2 downto 0);
    pixelBlue   : out  std_logic_vector(1 downto 0);
    pixelActive : out  std_logic
);
end copter_gen;

architecture Behavioral of copter_gen is

    signal active_color   : std_logic;
    signal absolute_x_min : unsigned(9 downto 0):= (others => '0');
    signal absolute_x_max : unsigned(9 downto 0):= (others => '0');
    signal absolute_y_min : unsigned(9 downto 0):= (others => '0');
    signal absolute_y_max : unsigned(9 downto 0):= (others => '0');

    CONSTANT COPTER_MAX_WITDH  : INTEGER := 50;
    CONSTANT COPTER_MAX_HEIGHT : INTEGER := 18;

    --how far to the right should it be
    CONSTANT COPTER_BASE_X_OFFSET : INTEGER := 20;

    signal pixelActive_int 	: std_logic;
    signal pixelRGB 			: std_logic_vector(7 downto 0);
    signal pixel_y_int 		: unsigned(9 downto 0);
    signal pixel_x_int 		: unsigned(9 downto 0);
    signal clk50 				: std_logic;

    subtype row_pixels is STD_LOGIC_VECTOR (0 to 49);
    type image is array(0 to 17) of row_pixels;


--"0000000000000111111111111111111111111000",
--"1110000000000000000000011100000000000000",
--"0111000000000000000000011100000000000000",
--"0011100000000000000000111110000000000000",
--"0011111110000000000011111111111000000000",
--"0001111110000000001111111111111111000000",
--"0011111110000000111111111111111111100000",
--"0111111111111111111111111111111111111000",
--"0111111111111111111111111111111111111100",
--"0111111111111111111111111111111111111110",
--"0011111111111111111111111111111111111111",
--"0000000110000000000000000001100001100000"


    CONSTANT copter_down : image :=
    (
        "01111000000000001111110000000000000000000000000000",
        "01111000000000000001111111111110000000000000000000",
        "01111100000000000000000011111111111111110000000000",
        "00111110000000000000000000000011111111111111111110",
        "00011111000000000000000000000011111100000000011111",
        "00011111110000000000000000000111111100000000000000",
        "00111111111000000000000000011111111110000000000000",
        "01111111111000000000000001111111111111000000000000",
        "11111111111100000000000111111111111111111000000000",
        "11111111111110111110011111111111111111111110000000",
        "11111111111111111111111111111111111111111111110000",
        "11111111111111111111111111111111111111111111111000",
        "01111111111111111111111111111111111111111111111100",
        "00000001111111111111111111111111111111111111111110",
        "00000000000000000001111111111111111111111111111111",
        "00000000000000000000000000001111111111111111111111",
        "00000000000000000000000000000000001111111111111111",
        "00000000000000000000000000000000000000000000000011"
    );


    CONSTANT copter_up : image :=
    (
        "00000000000000000000000000000000000000000011111000",
        "00000000000000000000000000000000001111111110000000",
        "00000000000000000000001111111111111110000000000000",
        "00000000000000001111111111101111110000000000000000",
        "00000000000000000000000000001111110000000000000000",
        "00000000000000000000000000001111111000000000000000",
        "01111100000000000000000000011111111111110000000000",
        "00111111000000000000000011111111111111111111100000",
        "00011111111000000000000111111111111111111111111000",
        "00001111111110000000011111111111111111111111111100",
        "00001111111110000000111111111111111111111111111110",
        "00011111111111011111111111111111111111111111111111",
        "00111111111111111111111111111111111111111111111110",
        "00111111111111111111111111111111001111111110000000",
        "00111111111111111111111111000000000011000000000000",
        "00011111111111111110000000000000000000000000000000",
        "00001111111111000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000");


begin

    --Determin when the VGA display is in the Copter Area
    -- It's a box around the copter base address (0,0 upper left corner)
    active_proc :	process(clk,rst)
    begin
        if(rst = '1') then
            pixelActive_int <= '0';
            pixel_y_int     <= (others=>'0');
            pixel_x_int     <= (others=>'0');
            absolute_x_min  <= (others=>'0');
            absolute_x_max  <= (others=>'0');
            absolute_y_min  <= (others=>'0');
            absolute_y_max  <= (others=>'0');
        elsif(rising_edge(clk)) then
            pixel_y_int     <= pixel_y;
            pixel_x_int     <= pixel_x;
            absolute_x_min  <= copter_pos_x + COPTER_BASE_X_OFFSET;
            absolute_x_max  <= copter_pos_x + COPTER_BASE_X_OFFSET + COPTER_MAX_WITDH;
            absolute_y_min  <= copter_pos_y + 0;
            absolute_y_max  <= copter_pos_y + COPTER_MAX_HEIGHT;

            if(  (pixel_x_int >= absolute_x_min)and (pixel_x_int <absolute_x_max) and (pixel_y_int >= absolute_y_min) and (pixel_y_int <  absolute_y_max) ) then
                pixelActive_int <= '1';
            else
                pixelActive_int <= '0';
            end if;
        end if;
    end process;

    --If the pixel is active (in the copter box), then Lookup if the pixel has color  - based on up_down_n state
    process(clk,rst)
    begin
        if(rst = '1') then
            active_color <= '0';
        elsif(rising_edge(clk)) then
            if(pixelActive_int = '1') then
                if(up_down_n = '0') then
                    active_color <= copter_down( to_integer(pixel_y_int - absolute_y_min) ) ( to_integer(pixel_x_int - absolute_x_min) );
                else
                    active_color <= copter_up( to_integer(pixel_y_int - absolute_y_min) ) ( to_integer(pixel_x_int - absolute_x_min) );
                end if;
            else
                active_color <= '0';
            end if;
        end if;
    end process;


    --Assign the Color - currently static 1 color - displated when active color is '1'
    -- Set to all Blue
    pixelBlue(0) <= active_color;
    pixelBlue(1) <= active_color;
    pixelRed     <= "000";
    pixelGreen   <= "000";

    --Assert pixelActive only when active_color is high - prevents the black box
    pixelActive <= pixelActive_int and active_color;


end Behavioral;
