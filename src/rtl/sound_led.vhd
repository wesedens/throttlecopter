
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use WORK.ALL;

-- This Module controls the Sound and the led's during the game

entity sound_led is
    Port ( 	clk_50 			: in  STD_LOGIC;	
				reset				: in	STD_LOGIC;
				crash				: in	STD_LOGIC;
				start				: in 	STD_LOGIC;
				output			: out STD_LOGIC;
				LED				: out STD_LOGIC_VECTOR (7 downto 0));	 
end sound_led;

architecture Behavioral of sound_led is

component counterWithPulse is
    port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           MaxCounter : in  unsigned(27 downto 0);
           Pulse : out  STD_LOGIC);
end component;

component lookup is 
	port ( 	clk: in std_logic;
				phase_in: in std_logic_vector(3 downto 0);
				sine: out std_logic_vector(9 downto 0));
end component;


component dac is
	port (	clk	:	in std_logic;
				rst	:	in	std_logic;
				DACin	:	in	std_logic_vector(9 downto 0);
				DACout	:	out	std_logic);
end component;

component Clock_Double is 
	Port (CLKIN_IN   : in    std_logic; 
          RST_IN     : in    std_logic; 
          CLK0_OUT   : out   std_logic; 
          CLK2X_OUT  : out   std_logic; 
          LOCKED_OUT : out   std_logic);
end component;


type disp_char is array (3 downto 0) of std_logic_vector(3 downto 0);
signal display_tmp: disp_char;

signal	clk_100				: 	std_logic;	--100 MHz clock
signal	clk_50_out			: 	std_logic;	--50 	MHz clock
signal	enable				:	std_logic;

signal	sample_pulse		:	std_logic;
signal	note_pulse			:	std_logic;

signal	note_toggle			:	std_logic_vector(2 downto 0);

signal	phase_out			:	unsigned(3 downto 0);
signal	phase_in				:	std_logic_vector(3 downto 0);

signal	sine_out				:	std_logic_vector(9 downto 0);
signal	sine_level_out		:	std_logic_vector(9 downto 0);
signal	dac_in				:	std_logic_vector(9 downto 0);

signal	freq_value			:	unsigned(27 downto 0);

signal	toggle_freq			:	unsigned(27 downto 0);

signal	led_signal			:	std_logic_vector(7 downto 0);


signal	start_bit				:	std_logic;
signal	crash_bit				:	std_logic;


begin


-- This DCM generates my 100 MHz clock
my_dcm	: entity Clock_Double port map( 
			CLKIN_IN   =>	clk_50,
			RST_IN     =>	'0',
         CLK0_OUT   =>	clk_50_out,
         CLK2X_OUT  =>	clk_100,
         LOCKED_OUT =>	enable);



-- This process will set the toggle frequency between notes
process(clk_100, reset)
begin
	if(reset = '1') then
		toggle_freq	<=	X"2000000";
			crash_bit	<= '0';
	elsif(rising_edge(clk_100)) then
		if (crash_bit = '0') then
			toggle_freq	<=	X"2000000";
			if(crash = '1') then
				toggle_freq	<=	X"5F5E100";
				crash_bit	<= '1';
			end if;
		end if;
	end if;
end process;

-- This will create the pulse to toggle the notes on		
note_bg_toggle_freq : entity counterWithPulse port map(
		clk 			=> clk_100,
		reset			=>	reset,
		MaxCounter	=>	toggle_freq,	--X"5F5E100",	--"2faf080",	--one second
		Pulse			=>	note_pulse);
						
-- This process will toggle to signal the switch between notes
process(clk_100)
begin
	if(reset = '1') then
		note_toggle	<=	"000";
		led_signal	<=	"00000000";
		start_bit	<=	'0';
	elsif(rising_edge(clk_100)) then
		if (start_bit = '0') then
			if (start = '1') then
				led_signal	<=	"00000001";
				start_bit <= '1';
			else
				freq_value	<=	X"0000000";	
			end if;
		else
			if(crash = '1') then
				freq_value	<=	X"00117AA";
				led_signal(7 downto 0)	<=	"11111111";
				note_toggle <= "010";
			elsif(note_pulse = '1') then
				if(note_toggle = "000") then
						freq_value	<=	X"0008BD2";	
						led_signal(7 downto 0)	<=	led_signal(6 downto 0) & led_signal(7);
						note_toggle <= "001";
				elsif(note_toggle = "001") then
						freq_value	<=	X"0009423";	
						led_signal(7 downto 0)	<=	led_signal(6 downto 0) & led_signal(7);
						note_toggle <= "000";
				elsif(note_toggle = "010") then
					freq_value	<=	X"0014C8D";	
					led_signal(7 downto 0)	<=	"00000000";
					note_toggle <= "011";
				elsif(note_toggle = "011") then
					freq_value	<=	X"0018B7B";	
					led_signal(7 downto 0)	<=	"11111111";
					note_toggle <= "100";
				else
					freq_value	<=	X"0000000";	
					led_signal(7 downto 0)	<=	"00000000";
					note_toggle <= "101";
				end if;
			end if;
		end if;
	end if;
end process;

LED	<=	led_signal;
					
--This is my sample rate generator		
eight_KHz : entity counterWithPulse port map(
			clk 			=> clk_100,
			reset			=>	reset,
			MaxCounter	=> freq_value,			
			Pulse			=>	sample_pulse);

--This process accomplishes my phase accumulator
process (clk_100)
begin
	if(rising_edge(clk_100)) then
		if(sample_pulse = '1') then
				phase_out <= phase_out + 1;
		end if;
	end if;
end process;

--phase_in <= std_logic_vector(phase_out);
phase_in	<= phase_out(3) & phase_out(2) & phase_out(1) & phase_out(0);


-- Implementation of the sine lookup table
my_lut :	lookup port map(
			clk		=>	clk_100,
			phase_in	=>	phase_in,
			sine		=>	sine_out);
				
-- Level Shift
sine_level_out(9 downto 0) <=	not sine_out(9) & sine_out(8 downto 0);


dac_in <=	sine_level_out;

-- Implementation of the DAC IP
my_dac	:	dac port map(
				clk		=>		clk_100,
				rst		=> 	reset,
				DACin		=>		dac_in,
				DACout	=>		output);

end Behavioral;

