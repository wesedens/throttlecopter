--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 12.4
--  \   \         Application : xaw2vhdl
--  /   /         Filename : Clock_Double.vhd
-- /___/   /\     Timestamp : 04/12/2011 18:31:19
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: xaw2vhdl-st C:\\Users\Justin\Documents\FPGA\Projects\McDowell_Lab7\lab7\ipcore_dir\.\Clock_Double.xaw C:\\Users\Justin\Documents\FPGA\Projects\McDowell_Lab7\lab7\ipcore_dir\.\Clock_Double
--Design Name: Clock_Double
--Device: xc3s500e-4fg320
--
-- Module Clock_Double
-- Generated by Xilinx Architecture Wizard
-- Written for synthesis tool: XST

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Clock_Double is
   port ( CLKIN_IN   : in    std_logic; 
          RST_IN     : in    std_logic; 
          CLK0_OUT   : out   std_logic; 
          CLK2X_OUT  : out   std_logic; 
          LOCKED_OUT : out   std_logic);
end Clock_Double;

architecture BEHAVIORAL of Clock_Double is
   signal CLKFB_IN   : std_logic;
   signal CLK0_BUF   : std_logic;
   signal CLK2X_BUF  : std_logic;
   signal GND_BIT    : std_logic;
begin
   GND_BIT <= '0';
   CLK0_OUT <= CLKFB_IN;
   CLK0_BUFG_INST : BUFG
      port map (I=>CLK0_BUF,
                O=>CLKFB_IN);
   
   CLK2X_BUFG_INST : BUFG
      port map (I=>CLK2X_BUF,
                O=>CLK2X_OUT);
   
   DCM_SP_INST : DCM_SP
   generic map( CLK_FEEDBACK => "1X",
            CLKDV_DIVIDE => 2.0,
            CLKFX_DIVIDE => 1,
            CLKFX_MULTIPLY => 4,
            CLKIN_DIVIDE_BY_2 => FALSE,
            CLKIN_PERIOD => 20.000,
            CLKOUT_PHASE_SHIFT => "NONE",
            DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
            DFS_FREQUENCY_MODE => "LOW",
            DLL_FREQUENCY_MODE => "LOW",
            DUTY_CYCLE_CORRECTION => TRUE,
            FACTORY_JF => x"C080",
            PHASE_SHIFT => 0,
            STARTUP_WAIT => FALSE)
      port map (CLKFB=>CLKFB_IN,
                CLKIN=>CLKIN_IN,
                DSSEN=>GND_BIT,
                PSCLK=>GND_BIT,
                PSEN=>GND_BIT,
                PSINCDEC=>GND_BIT,
                RST=>RST_IN,
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>CLK0_BUF,
                CLK2X=>CLK2X_BUF,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>LOCKED_OUT,
                PSDONE=>open,
                STATUS=>open);
   
end BEHAVIORAL;

