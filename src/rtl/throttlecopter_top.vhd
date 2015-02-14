--------------------------------------------------------------------------------
-- Engineer: The Throttle Copter Team
--
--

-- Create Date:    09:15:39 04/15/2011
-- Design Name:
-- Module Name:    throttleCopter_top - Behavioral
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity throttleCopter_top is
    Port (
        clk       : in   STD_LOGIC;
        leds      : out  STD_LOGIC_VECTOR(7 downto 0);
        sw        : in   STD_LOGIC_VECTOR(7 downto 0);
        throttle  : in   STD_LOGIC;
        dac       : out  STD_LOGIC;
        vgaRed    : out  STD_LOGIC_VECTOR (2 downto 0);
        vgaGreen  : out  STD_LOGIC_VECTOR (2 downto 0);
        vgaBlue   : out  STD_LOGIC_VECTOR (1 downto 0);
        vgaHsync  : out  STD_LOGIC;
        vgaVsync  : out  STD_LOGIC);
end throttleCopter_top;

architecture Behavioral of throttleCopter_top is

CONSTANT C_RESET_LEVEL      : STD_LOGIC := '1';


signal sig_speed            : std_logic_vector(3 downto 0);
signal sig_update_scene     : std_logic;
signal game_start           : std_logic;
signal por_counter          : unsigned(10 downto 0);
signal rst                  : std_logic;

--------------------
-- signals from mixer to vga contoller
--------------------
signal sig_vgaRed           :  std_logic_vector(2 downto 0);
signal sig_vgaGreen         :  std_logic_vector(2 downto 0);
signal sig_vgaBlue          :  std_logic_vector(1 downto 0);

----------------------
-- x,y signals out to all image generators
-----------------------
signal current_vga_pixel_x  : unsigned(9 downto 0);
signal current_vga_pixel_y  : unsigned(9 downto 0);

-------------------------------
-- signals for Copter Generator
-------------------------------
signal copterPixelRed       :  std_logic_vector(2 downto 0);
signal copterPixelGreen     :  std_logic_vector(2 downto 0);
signal copterPixelBlue      :  std_logic_vector(1 downto 0);
signal copterPixelActive    :  std_logic;

-------------------------------
-- signals for Cave Generator
-------------------------------
signal cavePixelRed               :  std_logic_vector(2 downto 0);
signal cavePixelGreen             :  std_logic_vector(2 downto 0);
signal cavePixelBlue              :  std_logic_vector(1 downto 0);
signal cavePixelActive            :  std_logic;
signal vsync_past                 :  std_logic;
signal cave_update                :  std_logic;
signal vgaVsync_int               :  std_logic;
signal sig_display_start_screen_d :  std_logic;

-------------------------------
-- signals for Score Generator
-------------------------------
signal vga_25MHz_en      :  std_logic;
signal scorePixelRed     :  std_logic_vector(2 downto 0);
signal scorePixelGreen   :  std_logic_vector(2 downto 0);
signal scorePixelBlue    :  std_logic_vector(1 downto 0);
signal scorePixelActive  :  std_logic;
signal scorePixelRGB     :  std_logic_vector(2 downto 0);
signal scorePixelColor   :  std_logic;

signal throttle_db              : std_logic; -- debounced throttle input
signal sig_copter_pos_x         : unsigned(9 downto 0);
signal sig_copter_pos_y         : unsigned(9 downto 0);
signal sig_collision            : std_logic;
signal sig_display_start_screen : std_logic;
signal sig_game_in_progress     : std_logic;
signal clk50                    : std_logic;
signal sig_up_down_n            : std_logic;
signal output_off               : std_logic;

-------------------------------
-- signals for the sound generator
-------------------------------
signal	crash_trigger				:	std_logic;
signal	crash_trigger_state		:	std_logic;

begin


  clk50       <= clk;
  rst         <= sw(0);


  ---------------------------------------------------
  --
  ---------------------------------------------------
  vga_inst : entity work.vgaController
  Port map (
    clk           => clk50,
    rst           => rst,

    pixel_x       => current_vga_pixel_x,
    pixel_y       => current_vga_pixel_y,

    red_in        => sig_vgaRed,
    green_in      => sig_vgaGreen,
    blue_in       => sig_vgaBlue,

    --External FPGA Connections
    vgaRed        => vgaRed,
    vgaGreen      => vgaGreen,
    vgaBlue       => vgaBlue,
    vgaHsync      => vgaHsync,
    vgaVsync      => vgaVsync_int
  );


  vgaMixer_inst : entity work.vgaMixer
  generic map(
      default_red   => (OTHERS=>'0'),
      default_green => (OTHERS=>'0'),
      default_blue  => (OTHERS=>'0')
  )
  Port map (
      clk           => clk50,
      rst           => rst,
      output_off    => output_off,

      layer0_red    => cavePixelRed,
      layer0_green  => cavePixelGreen,
      layer0_blue   => cavePixelBlue,
      layer0_active => cavePixelActive,

      layer1_red    => "000",
      layer1_green  => "000",
      layer1_blue   => "00",
      layer1_active => '0',

      layer2_red    => copterPixelRed,
      layer2_green  => copterPixelGreen,
      layer2_blue   => copterPixelBlue,
      layer2_active => copterPixelActive,

      layer3_red    => scorePixelRGB,
      layer3_green  => scorePixelRGB,
      layer3_blue   => scorePixelRGB(1 downto 0),
      layer3_active => scorePixelActive,

      --External FPGA Connections
      vgaRed           => sig_vgaRed,
      vgaGreen         => sig_vgaGreen,
      vgaBlue          => sig_vgaBlue
  );

  scorePixelRGB <= (others => scorePixelColor);

  ---------------------------------------------------
  --
  pulse_25MHz_inst : ENTITY work.pulse_gen
  GENERIC MAP(
    C_RESET_LEVEL         => C_RESET_LEVEL,
    C_CLK_PERIOD_NS       => 20,
    C_PULSE_PERIOD_NS     => 40
  )
  PORT MAP(
    clk                   => clk50,
    reset                 => rst,
    pulse_out             => vga_25MHz_en
  );

  ---------------------------------------------------
  --
  throttle_debounce : ENTITY work.debounce
  GENERIC MAP(
    C_RESET_LEVEL       => C_RESET_LEVEL,
    C_NUM_SIGNALS       => 1,
    C_USE_COUNTER       => TRUE,
    C_COUNTER_STOP      => 900000
  )
  PORT MAP(
    reset               => rst,
    clk                 => clk50,
    input(0)            => throttle,
    input_sync(0)       => throttle_db
  );

  ---------------------------------------------------
  --
  copter_position_inst : entity work.copter_position
  Port map(
    clk             => clk50,
    rst             => rst,
    enable          => sig_game_in_progress,
    game_restart    => sig_display_start_screen,
    throttle        => throttle_db,
    up_down_n       => sig_up_down_n,
    copter_pos_x    => sig_copter_pos_x,
    copter_pos_y    => sig_copter_pos_y
  );

  ---------------------------------------------------
  --
  copter_gen_inst : entity work.copter_gen
  Port Map (
    clk           => clk50,
    rst           => rst,
    up_down_n     => sig_up_down_n,
    copter_pos_x  => sig_copter_pos_x,
    copter_pos_y  => sig_copter_pos_y,
    pixel_x       => current_vga_pixel_x,
    pixel_y       => current_vga_pixel_y,
    pixelRed      => copterPixelRed,
    pixelGreen    => copterPixelGreen,
    pixelBlue     => copterPixelBlue,
    pixelActive   => copterPixelActive
  );

  ---------------------------------------------------
  --
  cave_gen_inst : ENTITY work.SG_top
  port map(
    clk            => clk50,
    rst            => rst,
    enable         => sig_game_in_progress,
    game_restart   => sig_display_start_screen,
    update_img     => cave_update,
    sliderSwitches => sig_speed,
    pixel_x        => current_vga_pixel_x,
    pixel_y        => current_vga_pixel_y,
    pixelActive    => cavePixelActive,
    pixelRed       => cavePixelRed,
    pixelGreen     => cavePixelGreen,
    pixelBlue      => cavePixelBlue
  );

  ---------------------------------------------------
  -- Delay the signal
  PROCESS(clk, rst)
  BEGIN
    IF (rst = '1') THEN
      vsync_past <= '0';
      sig_display_start_screen_d <= '0';
    ELSIF (rising_edge(clk)) THEN
      vsync_past <= vgaVsync_int;
      sig_display_start_screen_d <= sig_display_start_screen;
    END IF;
  END PROCESS;


  ---------------------------------------------------
  -- Only update the the cave when we are in the 'dead zone' of the vga update
  vgaVsync     <= vgaVsync_int;
  cave_update  <= (NOT vsync_past) AND vgaVsync_int WHEN sig_game_in_progress = '1' ELSE sig_update_scene;

  ---------------------------------------------------
  --
  collision_detection_inst : entity work.collision_detection
  Port map(

    clk             => clk50,
    rst             => rst,
    game_restart    => sig_display_start_screen,
    copter_active   => copterPixelActive,
    cave_active     => cavePixelActive,
    obstacle_active => '0',                         -- obstacle is not part of the scene gen - just drive '0' here
    collision       => sig_collision
  );

  ---------------------------------------------------
  --
  game_ctrl_inst : entity work.game_control
  Port map (
    clk                   => clk50,
    rst                   => rst,
    output_off            => output_off,
    throttle              => throttle_db,
    collision_in          => sig_collision,
    speed_in              => sw(4 downto 1),
    speed_out             => sig_speed,
    update_scene          => sig_update_scene,
    display_start_screen  => sig_display_start_screen,
    collision             => open,
    game_in_progress      => sig_game_in_progress
  );

  ---------------------------------------------------
  --
  score_inst : ENTITY work.score
  GENERIC MAP(
    C_RESET_LEVEL     => C_RESET_LEVEL,
    C_X_POS           => 10,
    C_Y_POS           => 10,
    C_CNT_WIDTH       => current_vga_pixel_x'LENGTH
  )
  PORT MAP(
    clk               => clk50,
    rst               => sig_display_start_screen,
    game_in_progress  => sig_game_in_progress,
    clk_en_25MHz      => vga_25MHz_en,
    score_sb          => sig_update_scene,
    Hpix_cnt          => STD_LOGIC_VECTOR(current_vga_pixel_x),
    Vpix_cnt          => STD_LOGIC_VECTOR(current_vga_pixel_y),
    font_en           => scorePixelActive,
    font_color        => scorePixelColor
  );

  ---------------------------------------------------
  --
  -- This process generates the crash signal necessary to trigger the
  -- end of the game for the sound generator
  process (clk50, sig_display_start_screen)
  begin
	if (sig_display_start_screen = '1') then
		crash_trigger			<= '0';
		crash_trigger_state	<=	'0';
	elsif (rising_edge(clk50)) then
		if(sig_collision = '1' and crash_trigger_state = '0') then
			crash_trigger 			<= '1';
			crash_trigger_state 	<= '1';
		else
			crash_trigger			<= '0';
		end if;
	end if;  
  end process;
  
  sound_inst : entity work.sound_led
  Port map(
    clk_50     => clk50,
    reset      => sig_display_start_screen,
    crash      => crash_trigger,
    start      => sig_game_in_progress,
    output     => dac,
    LED        => leds
  );

end Behavioral;
