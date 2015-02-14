----------------------------------------------------------------------------------
-- Engineer:  Gary Crum
--
-- Create Date:    09:43:49 04/15/2011
--
-- Module Name:    vgaMixer - Behavioral
--
--  VGA Pixles Mixer (actually a mux)
--  Layer 0 is the Background, Layers with increasing numbers are placed on top of
--  of the previous layer.
-- i.e. if Layer 0 wants to display a blue pixel and Layer 2 wants to display Green
--      a green pixel will be displayed.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY vgaMixer IS
GENERIC(
  default_red     : std_logic_vector(2 downto 0);
  default_green   : std_logic_vector(2 downto 0);
  default_blue    : std_logic_vector(1 downto 0)
);
PORT (
  clk             : in  STD_LOGIC;
  rst             : in  STD_LOGIC;
  output_off      : in  STD_LOGIC;

  layer0_red      : in  std_logic_vector(2 downto 0);
  layer0_green    : in  std_logic_vector(2 downto 0);
  layer0_blue     : in  std_logic_vector(1 downto 0);
  layer0_active   : in  std_logic;

  layer1_red      : in  std_logic_vector(2 downto 0);
  layer1_green    : in  std_logic_vector(2 downto 0);
  layer1_blue     : in  std_logic_vector(1 downto 0);
  layer1_active   : in  std_logic;

  layer2_red      : in  std_logic_vector(2 downto 0);
  layer2_green    : in  std_logic_vector(2 downto 0);
  layer2_blue     : in  std_logic_vector(1 downto 0);
  layer2_active   : in  std_logic;

  layer3_red      : in  std_logic_vector(2 downto 0);
  layer3_green    : in  std_logic_vector(2 downto 0);
  layer3_blue     : in  std_logic_vector(1 downto 0);
  layer3_active   : in  std_logic;

  --External FPGA Connections
  vgaRed          : out std_logic_vector(2 downto 0);
  vgaGreen        : out std_logic_vector(2 downto 0);
  vgaBlue         : out std_logic_vector(1 downto 0)
);
end vgaMixer;

architecture Behavioral of vgaMixer is


begin


process(clk, rst)
begin
    if (rst = '1') then
        vgaRed    <= (OTHERS=>'0');
        vgaGreen  <= (OTHERS=>'0');
        vgaBlue   <= (OTHERS=>'0');
    elsif(rising_edge(clk))then
        if(output_off = '1') then
            vgaRed    <= (others=>'0');
            vgaGreen  <= (others=>'0');
            vgaBlue   <= (others=>'0');
        else
            if (layer3_active = '1') then
                    vgaRed    <= layer3_red;
                    vgaGreen  <= layer3_green;
                    vgaBlue   <= layer3_blue;
            elsif(layer2_active = '1') then
                    vgaRed    <= layer2_red;
                    vgaGreen  <= layer2_green;
                    vgaBlue   <= layer2_blue;
            elsif(layer1_active = '1') then
                    vgaRed    <= layer1_red;
                    vgaGreen  <= layer1_green;
                    vgaBlue   <= layer1_blue;
            elsif(layer0_active = '1') then
                    vgaRed    <= layer0_red;
                    vgaGreen  <= layer0_green;
                    vgaBlue   <= layer0_blue;
            else
                    vgaRed    <= default_red;
                    vgaGreen  <= default_green;
                    vgaBlue   <= default_blue;
            end if;
        end if;
    end if;
end process;
end Behavioral;

