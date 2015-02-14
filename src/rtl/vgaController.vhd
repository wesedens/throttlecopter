----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:17:25 04/15/2011 
-- Design Name: 
-- Module Name:    vgaController - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vgaController is
    Port ( clk 		 : in  STD_LOGIC;
           rst 		 : in  STD_LOGIC;
			  
			  pixel_x    : out unsigned(9 downto 0);
			  pixel_y    : out unsigned(9 downto 0);

			  red_in     : in std_logic_vector(2 downto 0);
			  green_in   : in std_logic_vector(2 downto 0);
			  blue_in    : in std_logic_vector(1 downto 0);
			  
			  --External FPGA Connections
			  vgaRed   	 : out std_logic_vector(2 downto 0);
			  vgaGreen 	 : out std_logic_vector(2 downto 0);
			  vgaBlue  	 : out std_logic_vector(1 downto 0);
			  vgaHsync   : out std_logic;
		     vgaVsync   : out std_logic);
			  
end vgaController;

architecture Behavioral of vgaController is

--	component pulse_gen is
--	generic (
		--C_MAX_COUNTER : unsigned(31 downto 0)
	--);
	--Port (
--		clk50 			: in   STD_LOGIC;
		--rst 				: in   STD_LOGIC;
		--pulse          : out  STD_LOGIC
	--);
	--end component pulse_gen;
		
	signal en25   : std_logic;
	
	signal horizontal_counter :  unsigned(9 downto 0):= (others => '0') ;
	signal vertical_counter   :  unsigned(9 downto 0):= (others => '0') ;
	signal tmp_h_c            :  unsigned(9 downto 0):= (others => '0');
	signal tmp_v_c            :  unsigned(9 downto 0):= (others => '0');
	signal display_active     :  std_logic:= '0';
	
	constant HCOUNT_MIN   : unsigned(9 downto 0) :=  TO_UNSIGNED(  0, horizontal_counter'length);
	constant HCOUNT_MAX   : unsigned(9 downto 0) :=  TO_UNSIGNED(799, horizontal_counter'length);
	constant VCOUNT_MIN   : unsigned(9 downto 0) :=  TO_UNSIGNED(  0, vertical_counter'length); 
	constant VCOUNT_MAX   : unsigned(9 downto 0) :=  TO_UNSIGNED(520, vertical_counter'length); 
	constant HSYNC_MIN    : unsigned(9 downto 0) :=  TO_UNSIGNED(  0, horizontal_counter'length);
	constant HSYNC_MAX    : unsigned(9 downto 0) :=  TO_UNSIGNED( 96, horizontal_counter'length);
	constant VSYNC_MIN    : unsigned(9 downto 0) :=  TO_UNSIGNED(  0, vertical_counter'length); 
	constant VSYNC_MAX    : unsigned(9 downto 0) :=  TO_UNSIGNED(  2, vertical_counter'length); 

begin

	--------------------------------------------------------
	--Generate a 25MHz Pulse
	--gen_25MHz_pulse : pulse_gen
	--generic map (
--		C_MAX_COUNTER => "00000000000000000000000000000001"
--	)
--	port map (
		--clk50 => clk,
		--rst 	=> rst,
		--pulse => en25
	--);

  
  pulse_25MHz_gen : ENTITY work.pulse_gen
  GENERIC MAP(
    C_RESET_LEVEL         => '1',
    C_CLK_PERIOD_NS       => 20,
    C_PULSE_PERIOD_NS     => 40
  )
  PORT MAP( 
    clk                   => clk,
    reset                 => rst,
    pulse_out             => en25
  ); 




	---------------------------------------------------
	--Horizontal Counter
	process(clk, rst)
	begin
		if(rst = '1') then
			horizontal_counter <= (OTHERS => '0');
		elsif( rising_edge(clk) ) then
			if(en25 = '1') then
					if( horizontal_counter  = HCOUNT_MAX ) then
					horizontal_counter <= (OTHERS => '0');
				else
					horizontal_counter <= horizontal_counter + 1;
				end if;
			end if;
		end if;
	end process;
	
	----------------------------------------------------------------
	--Vertical Counter
	process(clk, rst)
	begin
		if(rst = '1') then
			vertical_counter <= (OTHERS => '0');
		elsif( rising_edge(clk) ) then
			if(en25 = '1') then
				if(horizontal_counter =  HCOUNT_MIN   ) then
					if( vertical_counter  = VCOUNT_MAX  ) then
						vertical_counter <= (OTHERS => '0');
					else
						vertical_counter <= vertical_counter + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	--------------------------------------------------------------
	--Horizontal Sync Signal
	vgaHsync <= '0' 	when ( ( horizontal_counter > HSYNC_MIN) 
	                  AND ( horizontal_counter < HSYNC_MAX  ) )
						  else '1';
	--------------------------------------------------------------
	--Vertical Sync Signal
	vgaVsync <= '0' 	when ( ( vertical_counter > VSYNC_MIN ) 
	                  AND ( vertical_counter < VSYNC_MAX ) )
						  else '1';
	
	------------------------------------------------------------------
   -- Set 1 when when pixels are allowed to be drive with RGB values
	display_active <= '1' when (  ( horizontal_counter > TO_UNSIGNED(144, horizontal_counter'length) ) AND 
	                       ( horizontal_counter < TO_UNSIGNED(784, horizontal_counter'length) ) )
							AND( ( vertical_counter > TO_UNSIGNED(31, vertical_counter'length) ) AND 
							     ( vertical_counter < TO_UNSIGNED(511, vertical_counter'length) ) )
							else '0';
							



						
	---- Display Grid Logic	
	---- Grid pixel ranges
	--- 640 pixels in columns
	--- 480 pixels in row
	--- 20x15 grid
	--- 32x32 pixel square for the gr
	--
	----	  G     B     G   ...   Starts with G  even row
	----	  B     G     B  ...    Starts with B  odd row
	
	----	0  31|32 63|64  95|96   127|128...
	----        
	----0000000 - 0011111   G (0  31)     when bit 5 = 0
	----0100000 - 0111111   B (32 63)     when bit 5 = 1
	----1000000 - 1011111   G (65 95)
	----1100000 - 1111111   B (96 127)
	----
	---- Squares are 32bit wide
	---- the h and v count are 'shifted' with respect to zero for the active display area, 
	---- so I can't just tap onto bit 5 for a 32bit count
	---- so, let's shift them back

	---- make counters that start at 0 for the active display area -- ie pixel 0,0
	tmp_h_c <= horizontal_counter - 145;		 
	tmp_v_c <= vertical_counter - 32;


	
	process(clk, rst)
	begin
		if(rst = '1') then
			pixel_x <= (others=>'0');
			pixel_y <=  (others=>'0');
			
		elsif( rising_edge(clk) ) then
			if(en25 = '1') then
					pixel_x <= tmp_h_c;
					pixel_y <= tmp_v_c;
			end if;
		end if;
	end process;
	
	
	
	
	
	--Drive the output pins
	vgaRed   <= red_in   when (display_active = '1') else (OTHERS => '0');
	vgaGreen <= green_in when (display_active = '1') else (OTHERS => '0');
	vgaBlue  <= blue_in  when (display_active = '1') else (OTHERS => '0');

	

end Behavioral;

