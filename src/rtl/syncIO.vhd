--------------------------------------------------------------------------------
-- Company:			Johns Hopkins University / Applied Physics Laboratory
-- Engineer:		Wes Edens
--
-- Create Date:		11:00 AM 01/18/2011
-- Design Name:		
-- Module Name:		timing_ctrl
-- Project Name:	Thermal Imaging IRAD
-- Target Devices:	XC3S400-4PQ208
-- Tool Versions:	ISE 12.3
-- Description:		Generates the timing control signals to run the thermal imager
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- PACKAGE BODY SYNC_FUNCTIONS IS
-------------------------------------------------------------------------------
--#############################################################################
-- Pulse Synchronizer
-- takes a pulse in one clock domain and creates a pulse in a different domain
--#############################################################################
-------------------------------------------------------------------------------
ENTITY syncPULSE IS
	GENERIC(
		C_RESET_LEVEL	 :  STD_LOGIC      :=   '0';
    C_NUM_SIGNALS  :  NATURAL        :=   1
  );
	PORT (
    in_reset       : IN    STD_LOGIC;
    out_reset      : IN    STD_LOGIC;
		in_clk         : IN    STD_LOGIC;
    out_clk        : IN    STD_LOGIC;
    in_signal      : IN    STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0);
    out_signal     : OUT   STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0)
	);
END syncPULSE;

ARCHITECTURE arch OF syncPULSE IS
-------------------------------------------------------------------------------
-- Signal and Type Declarations
-------------------------------------------------------------------------------
  
  SIGNAL   in_sig_reg     : STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0);
  
  TYPE SYNC_DELAY IS ARRAY (C_NUM_SIGNALS-1 downto 0) OF STD_LOGIC_VECTOR(2 downto 0);
  SIGNAL   signal_sync    : SYNC_DELAY;

BEGIN
-------------------------------------------------------------------------------
-- Begin Architecture
-------------------------------------------------------------------------------

 sync_TFF : PROCESS(in_reset, in_clk)
 BEGIN
   IF (in_reset = C_RESET_LEVEL) THEN
     in_sig_reg <= (others => '0');
   ELSIF rising_edge(in_clk) THEN

     -- infer a T flip flop
     FOR i IN 0 TO C_NUM_SIGNALS-1 LOOP 
       in_sig_reg(i) <= in_sig_reg(i) XOR in_signal(i); 
     END LOOP;

   END IF;
 END PROCESS;
 
 
  -- Exposure_Start is a one shot signal that start the state machine, We will register the status
  -- status of all the configuration registers on this signal 
 sync_DFF : PROCESS(out_reset, out_clk)
 BEGIN
   IF (out_reset = C_RESET_LEVEL) THEN
     signal_sync <= (others => (others => '0'));
   ELSIF rising_edge(out_clk) THEN

     FOR i IN 0 TO C_NUM_SIGNALS-1 LOOP 
       signal_sync(i)   <= signal_sync(i)(signal_sync(i)'HIGH-1 downto 0) & in_sig_reg(i); 
     END LOOP;

   END IF;
 END PROCESS;
   
  pulse_gen_proc : FOR i IN 0 TO C_NUM_SIGNALS-1 GENERATE
    out_signal(i)    <= signal_sync(i)(signal_sync(i)'HIGH) XOR signal_sync(i)(signal_sync(i)'HIGH-1);
  END GENERATE;

END arch;

-------------------------------------------------------------------------------
--#############################################################################
-- Pulse Generator
-- takes an input signal and turns it into a one shot signal
--#############################################################################
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY single_shot IS
  GENERIC(
		C_RESET_LEVEL	      :  STD_LOGIC      :=   '0';
    C_ACTIVE_LEVEL	    :  STD_LOGIC      :=   '1';
    C_STARTUP_DELAY     :  NATURAL        := 900000;
    C_NUM_SIGNALS       :  NATURAL        :=   1
  );
  PORT(
    reset               : IN    STD_LOGIC;
    clk                 : IN    STD_LOGIC;
    din                 : IN    STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0);
    pulse_out           : OUT   STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0)
  );
  END single_shot;

ARCHITECTURE Behavioral OF single_shot IS
-------------------------------------------------------------------------------
-- Signal and Type Declarations
-------------------------------------------------------------------------------

  TYPE SYNC_DELAY IS ARRAY (C_NUM_SIGNALS-1 downto 0) OF STD_LOGIC_VECTOR(2 downto 0);
  SIGNAL   signal_sync    : SYNC_DELAY  := (others =>(others => '0'));
  SIGNAL   enable         : STD_LOGIC   := '0';

BEGIN
-------------------------------------------------------------------------------
-- Begin Architecture
-------------------------------------------------------------------------------

 sync_DFF_proc : PROCESS(reset, clk)
 VARIABLE startup_cnt   : NATURAL RANGE 0 TO C_STARTUP_DELAY := 0;
 BEGIN
   IF (reset = C_RESET_LEVEL) THEN
     signal_sync <= (others => (others => NOT C_ACTIVE_LEVEL));
     enable      <= '0';
     startup_cnt := 0;
   ELSIF rising_edge(clk) THEN

     FOR i IN 0 TO C_NUM_SIGNALS-1 LOOP 
       signal_sync(i)   <= signal_sync(i)(signal_sync(i)'HIGH-1 downto 0) & din(i); 
     END LOOP;
     
     IF (startup_cnt < C_STARTUP_DELAY) THEN
       startup_cnt := startup_cnt + 1;
     ELSE
       enable <= '1';
     END IF;
   END IF;
 END PROCESS;
   
  pulse_gen_proc : FOR i IN 0 TO C_NUM_SIGNALS-1 GENERATE
    pulse_out(i)    <= (NOT signal_sync(i)(signal_sync(i)'HIGH)) AND signal_sync(i)(signal_sync(i)'HIGH-1) WHEN enable = '1' ELSE '0';
  END GENERATE;
  
END Behavioral;

-------------------------------------------------------------------------------
--#############################################################################
-- Input Signal Synchronizer
-- switches input signals to a new clock domain, handles metastability
--#############################################################################
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY io_sync IS
  GENERIC(
		C_RESET_LEVEL	      :  STD_LOGIC      :=   '0';
    C_NUM_SIGNALS       :  NATURAL        :=   1;
    C_SHIFT_REG_WIDTH   :  NATURAL        :=   3
  );
  PORT(
    reset               : IN    STD_LOGIC;
    clk                 : IN    STD_LOGIC;
    input               : IN    STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0);
    input_sync          : OUT   STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0)
  );
  END io_sync;

ARCHITECTURE Behavioral OF io_sync IS
-------------------------------------------------------------------------------
-- Signal and Type Declarations
-------------------------------------------------------------------------------

  TYPE SYNC_DELAY IS ARRAY (C_NUM_SIGNALS-1 downto 0) OF STD_LOGIC_VECTOR(C_SHIFT_REG_WIDTH-1 downto 0);
  SIGNAL   signal_sync    : SYNC_DELAY;

BEGIN
-------------------------------------------------------------------------------
-- Begin Architecture
-------------------------------------------------------------------------------

 sync_DFF_proc : PROCESS(reset, clk)
 BEGIN
   IF (reset = C_RESET_LEVEL) THEN
     signal_sync <= (others => (others => '0'));
   ELSIF rising_edge(clk) THEN

     FOR i IN 0 TO C_NUM_SIGNALS-1 LOOP 
       signal_sync(i)   <= signal_sync(i)(signal_sync(i)'HIGH-1 downto 0) & input(i); 
     END LOOP;

   END IF;
 END PROCESS;
   
  input_sync_gen_proc : FOR i IN 0 TO C_NUM_SIGNALS-1 GENERATE
    input_sync(i)    <= signal_sync(i)(signal_sync(i)'HIGH);
  END GENERATE;
  
END Behavioral;

-------------------------------------------------------------------------------
--#############################################################################
-- Input Signal Synchronizer
-- switches input signals to a new clock domain, handles metastability
--#############################################################################
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY debounce IS
  GENERIC(
		C_RESET_LEVEL	      :  STD_LOGIC      :=   '0';
    C_ACTIVE_LEVEL	    :  STD_LOGIC      :=   '1';
    C_NUM_SIGNALS       :  NATURAL        :=   1;
    C_USE_COUNTER       :  BOOLEAN        :=   TRUE;
    C_COUNTER_STOP      :  NATURAL        :=   10000;
    C_SHIFT_REG_WIDTH   :  NATURAL        :=   50
  );
  PORT(
    reset               : IN    STD_LOGIC;
    clk                 : IN    STD_LOGIC;
    input               : IN    STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0);
    input_sync          : OUT   STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0)
  );
  END debounce;

ARCHITECTURE Behavioral OF debounce IS
-------------------------------------------------------------------------------
-- Signal and Type Declarations
-------------------------------------------------------------------------------
  CONSTANT C_FULL_REG     : STD_LOGIC_VECTOR(C_SHIFT_REG_WIDTH-1 downto 0) := (others => '1');
  
  TYPE SYNC_DELAY IS ARRAY (C_NUM_SIGNALS-1 downto 0) OF STD_LOGIC_VECTOR(C_SHIFT_REG_WIDTH-1 downto 0);
  TYPE SYNC_CNT   IS ARRAY (C_NUM_SIGNALS-1 downto 0) OF NATURAL RANGE 0 TO C_COUNTER_STOP;
  SIGNAL   signal_sync    : SYNC_DELAY;

BEGIN
-------------------------------------------------------------------------------
-- Begin Architecture
-------------------------------------------------------------------------------
counter_debounce_gen : IF (C_USE_COUNTER = TRUE) GENERATE
   sync_CNT_proc : PROCESS(reset, clk)
   VARIABLE delay_cngt : SYNC_CNT   := (others => 0);
   BEGIN
     IF (reset = C_RESET_LEVEL) THEN
       FOR i IN 0 TO C_NUM_SIGNALS-1 LOOP 
         delay_cngt(i) := 0;
       END LOOP;
     ELSIF rising_edge(clk) THEN
       FOR i IN 0 TO C_NUM_SIGNALS-1 LOOP 
         IF (input(i) = C_ACTIVE_LEVEL) THEN
           IF (delay_cngt(i) < C_COUNTER_STOP-1 ) THEN
             delay_cngt(i) := delay_cngt(i) + 1;
           END IF;
         ELSE
           delay_cngt(i) := 0;
         END IF;
         
         IF (delay_cngt(i) = C_COUNTER_STOP-1) THEN
           input_sync(i) <= C_ACTIVE_LEVEL;
         ELSE 
           input_sync(i) <= NOT C_ACTIVE_LEVEL;
         END IF;
       END LOOP;
     END IF;
   END PROCESS;
END GENERATE;

shift_reg_debounce : IF (C_USE_COUNTER = FALSE) GENERATE
   sync_DFF_proc : PROCESS(reset, clk)
   BEGIN
     IF (reset = C_RESET_LEVEL) THEN
       signal_sync <= (others => (others => '0'));
     ELSIF rising_edge(clk) THEN

       FOR i IN 0 TO C_NUM_SIGNALS-1 LOOP 
         signal_sync(i)   <= signal_sync(i)(signal_sync(i)'HIGH-1 downto 0) & input(i); 
       END LOOP;

       
     END IF;
   END PROCESS;
     
    input_sync_gen_proc : FOR i IN 0 TO C_NUM_SIGNALS-1 GENERATE
      input_sync(i)    <= '1' WHEN signal_sync(i) = C_FULL_REG ELSE '0';
    END GENERATE;
END GENERATE;  
END Behavioral;
-- END PACKAGE BODY;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 package SYNC_FUNCTIONS is
-------------------------------------------------------------------------------
--#############################################################################
-- Create a package of all the sync functions
--#############################################################################
-------------------------------------------------------------------------------
COMPONENT syncPULSE IS
	GENERIC(
		C_RESET_LEVEL  :       STD_LOGIC      :=   '0';
    C_NUM_SIGNALS  :       NATURAL        :=   1
  );
	PORT (
    in_reset       : IN    STD_LOGIC;
    out_reset      : IN    STD_LOGIC;
		in_clk         : IN    STD_LOGIC;
    out_clk        : IN    STD_LOGIC;
    in_signal      : IN    STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0);
    out_signal     : OUT   STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0)
	);
END COMPONENT;

COMPONENT single_shot IS
  GENERIC(
		C_RESET_LEVEL        :  STD_LOGIC      :=   '0';
    C_NUM_SIGNALS        :  NATURAL        :=   1
  );
  PORT(
    reset               : IN    STD_LOGIC;
    clk                 : IN    STD_LOGIC;
    din                 : IN    STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0);
    pulse_out           : OUT   STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0)
  );
END COMPONENT;

COMPONENT io_sync IS
  GENERIC(
		C_RESET_LEVEL       :  STD_LOGIC      :=   '0';
    C_NUM_SIGNALS       :  NATURAL        :=   1;
    C_SHIFT_REG_WIDTH   :  NATURAL        :=   3
  );
  PORT(
    reset               : IN    STD_LOGIC;
    clk                 : IN    STD_LOGIC;
    input               : IN    STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0);
    input_sync          : OUT   STD_LOGIC_VECTOR(C_NUM_SIGNALS-1 downto 0)
  );
END COMPONENT;
  
 end SYNC_FUNCTIONS;