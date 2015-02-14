--------------------------------------------------------------------------------
-- Company: JHU/APL
-- Engineer: Wes Edens
--
-- Create Date:    02/12/11
-- Design Name:    
-- Module Name:    pulse_gen
-- Project Name:   Lab 2
-- Target Device:  NEXYS2
-- Tool versions:  
-- Description:    pulse generator
--
-- Dependencies: 
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY pulse_gen IS
    GENERIC (
      C_RESET_LEVEL         :      STD_LOGIC := '0';
      C_CLK_PERIOD_NS       :      NATURAL   := 20;
      C_PULSE_PERIOD_NS     :      NATURAL   := 1000000
    );
    PORT ( 
      clk                   : IN   STD_LOGIC;
      reset                 : IN   STD_LOGIC;
      pulse_out             : OUT  STD_LOGIC
			  ); 
END pulse_gen;

ARCHITECTURE Behavioral OF pulse_gen IS

CONSTANT C_COUNTER_VALUE      : NATURAL  := C_PULSE_PERIOD_NS/C_CLK_PERIOD_NS - 1;

BEGIN
  
  pulse_gen_proc : PROCESS(clk, reset)
    VARIABLE counter : NATURAL range 0 to C_COUNTER_VALUE := 0;
  BEGIN
    IF (reset = C_RESET_LEVEL) THEN
      counter   := 0;
      pulse_out <= '0';
    ELSIF rising_edge(clk) THEN
      IF ( counter = 0 ) THEN
        counter   := C_COUNTER_VALUE;
        pulse_out <= '1';
      ELSE
        counter   := counter - 1;
        pulse_out <= '0';
      END IF;
    END IF;     
  END PROCESS;
     
END Behavioral;

