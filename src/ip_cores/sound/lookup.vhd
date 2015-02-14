--------------------------------------------------------------------------------
--     (c) Copyright 1995 - 2010 Xilinx, Inc. All rights reserved.            --
--                                                                            --
--     This file contains confidential and proprietary information            --
--     of Xilinx, Inc. and is protected under U.S. and                        --
--     international copyright and other intellectual property                --
--     laws.                                                                  --
--                                                                            --
--     DISCLAIMER                                                             --
--     This disclaimer is not a license and does not grant any                --
--     rights to the materials distributed herewith. Except as                --
--     otherwise provided in a valid license issued to you by                 --
--     Xilinx, and to the maximum extent permitted by applicable              --
--     law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND                --
--     WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES            --
--     AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING              --
--     BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-                 --
--     INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and               --
--     (2) Xilinx shall not be liable (whether in contract or tort,           --
--     including negligence, or under any other theory of                     --
--     liability) for any loss or damage of any kind or nature                --
--     related to, arising under or in connection with these                  --
--     materials, including for any direct, or any indirect,                  --
--     special, incidental, or consequential loss or damage                   --
--     (including loss of data, profits, goodwill, or any type of             --
--     loss or damage suffered as a result of any action brought              --
--     by a third party) even if such damage or loss was                      --
--     reasonably foreseeable or Xilinx had been advised of the               --
--     possibility of the same.                                               --
--                                                                            --
--     CRITICAL APPLICATIONS                                                  --
--     Xilinx products are not designed or intended to be fail-               --
--     safe, or for use in any application requiring fail-safe                --
--     performance, such as life-support or safety devices or                 --
--     systems, Class III medical devices, nuclear facilities,                --
--     applications related to the deployment of airbags, or any              --
--     other applications that could lead to death, personal                  --
--     injury, or severe property or environmental damage                     --
--     (individually and collectively, "Critical                              --
--     Applications"). Customer assumes the sole risk and                     --
--     liability of any use of Xilinx products in Critical                    --
--     Applications, subject only to applicable laws and                      --
--     regulations governing limitations on product liability.                --
--                                                                            --
--     THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS               --
--     PART OF THIS FILE AT ALL TIMES.                                        --
--------------------------------------------------------------------------------
-- You must compile the wrapper file lookup.vhd when simulating
-- the core, lookup. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
Library XilinxCoreLib;
-- synthesis translate_on
ENTITY lookup IS
	port (
	clk: in std_logic;
	phase_in: in std_logic_vector(3 downto 0);
	sine: out std_logic_vector(9 downto 0));
END lookup;

ARCHITECTURE lookup_a OF lookup IS
-- synthesis translate_off
component wrapped_lookup
	port (
	clk: in std_logic;
	phase_in: in std_logic_vector(3 downto 0);
	sine: out std_logic_vector(9 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_lookup use entity XilinxCoreLib.dds_compiler_v4_0(behavioral)
		generic map(
			c_use_dsp48 => 0,
			c_phase_offset_value => "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
			c_amplitude => 0,
			c_channels => 1,
			c_phase_increment_value => "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0",
			c_has_rdy => 0,
			c_has_sincos => 1,
			c_has_sclr => 0,
			c_phase_offset => 0,
			c_phase_angle_width => 4,
			c_phase_increment => 2,
			c_has_rfd => 0,
			c_negative_sine => 0,
			c_has_phasegen => 0,
			c_has_channel_index => 0,
			c_latency => -1,
			c_por_mode => 0,
			c_has_ce => 0,
			c_outputs_required => 0,
			c_accumulator_width => 4,
			c_mem_type => 2,
			c_optimise_goal => 0,
			c_negative_cosine => 0,
			c_has_phase_out => 0,
			c_noise_shaping => 0,
			c_xdevicefamily => "spartan3e",
			c_output_width => 10);
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_lookup
		port map (
			clk => clk,
			phase_in => phase_in,
			sine => sine);
-- synthesis translate_on

END lookup_a;

