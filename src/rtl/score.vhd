--------------------------------------------------------------------------------
-- Company:			Johns Hopkins University / Applied Physics Laboratory
-- Engineer:		Wes Edens
--
-- Create Date:		11:00 AM 01/18/2011
-- Design Name:		
-- Module Name:		VGA_timing
-- Project Name:	Thermal Imaging IRAD
-- Target Devices:	XC3S400-4PQ208
-- Tool Versions:	ISE 12.3
-- Description:	
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

  
ENTITY score IS
	GENERIC(
		C_RESET_LEVEL	    :       STD_LOGIC      :=  '0';
		C_X_POS           :       NATURAL        := 100;
    C_Y_POS           :       NATURAL        := 100;
    C_CNT_WIDTH       :       NATURAL        :=  10
  );
  PORT(
    clk               : IN   STD_LOGIC;  
    rst               : IN   STD_LOGIC;
	 game_in_progress  : IN   STD_LOGIC;
    clk_en_25MHz      : IN   STD_LOGIC;
    score_sb          : IN   STD_LOGIC;
    Hpix_cnt          : IN   STD_LOGIC_VECTOR( C_CNT_WIDTH-1 downto 0 );
    Vpix_cnt          : IN   STD_LOGIC_VECTOR( C_CNT_WIDTH-1 downto 0 );
    font_en           : OUT  STD_LOGIC;
    font_color        : OUT  STD_LOGIC
  );
END score;

ARCHITECTURE rtl OF score IS
-------------------------------------------------------------------------------
-- Component Declarations
-------------------------------------------------------------------------------

-- We only have 192 memory locations filled 0xC0 because we only need font maps
-- for:     "SCORE:0123456789"
-- each character is 8x12 and there are 16 characters so we need
-- => 12x16x8 bits  = 1536 bits
-- => 12x16 bytes   =  192 bytes
-- We have to use an 8-bit address so we end up with 256 bytes total
COMPONENT font_rom IS
  PORT 
  (
    a        : IN  STD_LOGIC_VECTOR ( 8 downto 0 ); 
    spo      : OUT STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
END COMPONENT;

-------------------------------------------------------------------------------
-- Signal and Type Declarations
-------------------------------------------------------------------------------
CONSTANT C_CHAR_HEIGHT : INTEGER :=  12;
CONSTANT C_CHAR_WIDTH  : INTEGER :=   8;
CONSTANT C_NUM_CHARS   : INTEGER :=   6;
CONSTANT C_NUM_DIGITS  : INTEGER :=   4;
CONSTANT C_NUM_TOTAL   : INTEGER :=   C_NUM_CHARS+C_NUM_DIGITS;
CONSTANT C_FONT_POS_X1 : INTEGER := C_X_POS;
CONSTANT C_FONT_POS_Y1 : INTEGER := C_Y_POS;
CONSTANT C_FONT_POS_X2 : INTEGER := C_FONT_POS_X1 + C_CHAR_WIDTH*C_NUM_TOTAL -1;
CONSTANT C_FONT_POS_Y2 : INTEGER := C_FONT_POS_Y1 + C_CHAR_HEIGHT -1;

-- Font signals
SUBTYPE  font_index  IS STD_LOGIC_VECTOR(8 downto 0);
SUBTYPE  digit_reg   IS UNSIGNED(3 downto 0);
TYPE     font_lut    IS ARRAY (INTEGER range <>)  of font_index;
TYPE     digit_lut   IS ARRAY (INTEGER range 0 to C_NUM_DIGITS-1) of digit_reg;
SIGNAL   font_addr          : UNSIGNED( 8 downto 0 );
SIGNAL   font_data          : STD_LOGIC_VECTOR( 7 downto 0 );
SIGNAL   addr_cnt           : UNSIGNED( 2 downto 0 );
SIGNAL   font_mask          : STD_LOGIC;
SIGNAL   font_x_en          : STD_LOGIC;
SIGNAL   font_y_en          : STD_LOGIC;
SIGNAL   font_en_int        : STD_LOGIC;
SIGNAL   y_offset           : UNSIGNED( Vpix_cnt'RANGE );
SIGNAL   font_num_reg       : UNSIGNED(C_NUM_DIGITS*4-1 downto 0);
SIGNAL   font_num_index     : digit_lut;


SIGNAL   char_cnt           : NATURAL range 0 to C_NUM_CHARS   := 0;
SIGNAL   digit_cnt          : NATURAL range 0 to C_NUM_DIGITS  := 0;

--Set up test ASIC input data, the first number is address second is data
CONSTANT C_SCORE_TABLE : font_lut(0 to C_NUM_CHARS-1) :=(O"000", O"014", O"030", O"044", O"060", O"074"); 
CONSTANT C_NUM_TABLE   : font_lut(0 to 15)            :=(O"110", O"124", O"140", O"154", O"170", O"204", O"220", O"234", 
                                                         O"250", O"264", O"300", O"314", O"330", O"344", O"360", O"374");                                 

BEGIN
-------------------------------------------------------------------------------
-- Begin Architecture
-------------------------------------------------------------------------------
  font_rom_gen : font_rom
  PORT MAP
  (
    a        => STD_LOGIC_VECTOR(font_addr),
    spo      => font_data
  );
  
  digit_index_gen : FOR i in 0 to C_NUM_DIGITS-1 GENERATE
    font_num_index(i) <= font_num_reg(i*4+3 downto i*4);
  END GENERATE;
  
  
  
  -- Make our font enable signal
  font_en       <= font_en_int;
  font_en_int   <= '1' WHEN (font_x_en = '1' AND font_y_en = '1') ELSE '0';
  
  
  -- --Generate Horizontal and Vertical Active square shift register
  font_en_gen : PROCESS(Hpix_cnt, Vpix_cnt)
  BEGIN
    IF ( UNSIGNED(Hpix_cnt) >= C_FONT_POS_X1 AND UNSIGNED(Hpix_cnt) <= C_FONT_POS_X2 ) THEN
      font_x_en <= '1';
    ELSE
      font_x_en <= '0';
    END IF;
    
    IF ( UNSIGNED(Vpix_cnt) >= C_FONT_POS_Y1 AND UNSIGNED(Vpix_cnt) <= C_FONT_POS_Y2 ) THEN
      font_y_en <= '1';
    ELSE
      font_y_en <= '0';
    END IF;
  END PROCESS;
  
  score_gen : PROCESS(clk, rst)
  BEGIN
    IF (rst = C_RESET_LEVEL) THEN
      font_num_reg   <= (others => '0');
    ELSIF (rising_edge(clk)) THEN
      IF (score_sb = '1' and game_in_progress = '1') THEN
        font_num_reg   <= font_num_reg + 1;
      END IF;
    END IF;
  END PROCESS;
        
  font_text_gen : PROCESS(clk, rst)
  BEGIN
    IF (rst = C_RESET_LEVEL) THEN
      char_cnt     <=  0;
      digit_cnt    <=  0;
      addr_cnt     <= (others => '0');
    ELSIF (rising_edge(clk)) THEN
      IF (clk_en_25MHz = '1') THEN
        IF (font_en_int = '1') THEN
          IF (char_cnt < C_NUM_CHARS) THEN
            IF (addr_cnt < 7) THEN
              addr_cnt <= addr_cnt + 1;
            ELSE 
              addr_cnt  <= (others => '0');
              char_cnt  <= char_cnt + 1;
            END IF;
          ELSE
            IF (digit_cnt < C_NUM_DIGITS) THEN
              IF (addr_cnt < 7) THEN
                addr_cnt <= addr_cnt + 1;
              ELSE 
                addr_cnt  <= (others => '0');
                digit_cnt <= digit_cnt + 1;
              END IF;
            ELSE
            digit_cnt <= 0;
            addr_cnt  <= (others => '0');
            END IF;
          END IF;
        ELSE
          addr_cnt  <= (others => '0');
          char_cnt  <= 0;
          digit_cnt <= 0;
        END IF;
      END IF;
    END IF;
  END PROCESS;
  
  font_addr  <= UNSIGNED(C_SCORE_TABLE(char_cnt)) + y_offset(font_addr'RANGE) WHEN (font_en_int = '1' AND char_cnt < C_NUM_CHARS) ELSE
                UNSIGNED(C_NUM_TABLE(TO_INTEGER(font_num_index(C_NUM_DIGITS-1-digit_cnt)))) + y_offset(font_addr'RANGE) WHEN (font_en_int = '1' AND digit_cnt < C_NUM_DIGITS) ELSE
                y_offset(font_addr'RANGE);
  font_color <= font_mask;
  font_mask  <= font_data(7 - TO_INTEGER(addr_cnt));
  y_offset   <= UNSIGNED(Vpix_cnt) - TO_UNSIGNED(C_FONT_POS_Y1, y_offset'LENGTH);
end rtl;
