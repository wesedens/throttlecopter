--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: M.81d
--  \   \         Application: netgen
--  /   /         Filename: font_rom.vhd
-- /___/   /\     Timestamp: Sat Apr 30 10:11:44 2011
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -w -sim -ofmt vhdl ./tmp/_cg\font_rom.ngc ./tmp/_cg\font_rom.vhd 
-- Device	: 3s500efg320-5
-- Input file	: ./tmp/_cg/font_rom.ngc
-- Output file	: ./tmp/_cg/font_rom.vhd
-- # of Entities	: 1
-- Design Name	: font_rom
-- Xilinx	: C:\Xilinx\12.4\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity font_rom is
  port (
    a : in STD_LOGIC_VECTOR ( 8 downto 0 ); 
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end font_rom;

architecture STRUCTURE of font_rom is
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal BU2_N106 : STD_LOGIC; 
  signal BU2_N104 : STD_LOGIC; 
  signal BU2_N102 : STD_LOGIC; 
  signal BU2_N100 : STD_LOGIC; 
  signal BU2_N25 : STD_LOGIC; 
  signal BU2_N92 : STD_LOGIC; 
  signal BU2_N10 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000077 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000096 : STD_LOGIC; 
  signal BU2_N80 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000057 : STD_LOGIC; 
  signal BU2_N78 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047 : STD_LOGIC; 
  signal BU2_N11 : STD_LOGIC; 
  signal BU2_N24 : STD_LOGIC; 
  signal BU2_N01 : STD_LOGIC; 
  signal BU2_N14 : STD_LOGIC; 
  signal BU2_N56 : STD_LOGIC; 
  signal BU2_N29 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000042 : STD_LOGIC; 
  signal BU2_N28 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000031_183 : STD_LOGIC; 
  signal BU2_N39 : STD_LOGIC; 
  signal BU2_N48 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000114 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000113 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_178 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_9_177 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000112 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000110 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000109_174 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_91_173 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_10_172 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_7_f5_171 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_f5_170 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000108 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000107 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_92_167 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_101_166 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_102_165 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_11_164 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_f51 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_9_f5_162 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_5_f7_161 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_6_f6_160 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_7_f6_159 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000097 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_157 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_9_156 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000094 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000093 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000092 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_91_152 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_10_151 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_7_f5_150 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_f5_149 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000091 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000090_147 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000089_146 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_92_145 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_101_144 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000085 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000084 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_102_141 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_11_140 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_f51 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_9_f5_138 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_5_f7_137 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_6_f6_136 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_7_f6_135 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000081 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_133 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_9_132 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_91_131 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_10_130 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_7_f5_129 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_f5_128 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000074 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000073 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_92_125 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_101_124 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000070 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000068 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000067 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_102_120 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_11_119 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_f51 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_9_f5_117 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_5_f7_116 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_6_f6_115 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_7_f6_114 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000063 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_112 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_9_111 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_91_110 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f52 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_7_f5_108 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f5_107 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000060 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000036 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_92_104 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_101_103 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_102_102 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_11_101 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f51_100 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_9_f5_99 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_5_f7_98 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_6_f6_97 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_7_f6_96 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000049 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000048 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_93 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_9_92 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_91_91 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_10_90 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_7_f5_89 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_f5_88 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000041_87 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000040 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_92_85 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_101_84 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000039 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000038 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_102_81 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_11_80 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_f51 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_9_f5_78 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_5_f7_77 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_6_f6_76 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_7_f6_75 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000033 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000032 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_72 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_9_71 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000029 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000028 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000027 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000026 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_91_66 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_10_65 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_7_f5_64 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_f5_63 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000025 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000024_61 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000023 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000022_59 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_92_58 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_101_57 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000021 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000020 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_102_54 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_11_53 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_f51 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_9_f5_51 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_5_f7_50 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_6_f6_49 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_7_f6_48 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000016 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000015_46 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000014_45 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000013 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_43 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_9_42 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000012 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000011_40 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000010_39 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00009 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_91_37 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_10_36 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_7_f5_35 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_f5_34 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00008 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00007 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00006 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000105 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_92_29 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_101_28 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00004 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00003 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00002 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_102_23 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_11_22 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_f51 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_9_f5_20 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_5_f7_19 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_6_f6_18 : STD_LOGIC; 
  signal BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_7_f6_17 : STD_LOGIC; 
  signal a_2 : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal spo_3 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  a_2(8) <= a(8);
  a_2(7) <= a(7);
  a_2(6) <= a(6);
  a_2(5) <= a(5);
  a_2(4) <= a(4);
  a_2(3) <= a(3);
  a_2(2) <= a(2);
  a_2(1) <= a(1);
  a_2(0) <= a(0);
  spo(7) <= spo_3(7);
  spo(6) <= spo_3(6);
  spo(5) <= spo_3(5);
  spo(4) <= spo_3(4);
  spo(3) <= spo_3(3);
  spo(2) <= spo_3(2);
  spo(1) <= spo_3(1);
  spo(0) <= spo_3(0);
  VCC_0 : VCC
    port map (
      P => N1
    );
  GND_1 : GND
    port map (
      G => N0
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_11 : LUT4
    generic map(
      INIT => X"21ED"
    )
    port map (
      I0 => BU2_N106,
      I1 => a_2(4),
      I2 => a_2(1),
      I3 => BU2_N100,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_11_53
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_11_SW1 : LUT3
    generic map(
      INIT => X"8E"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(0),
      I2 => a_2(2),
      O => BU2_N106
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000161 : LUT4
    generic map(
      INIT => X"5192"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000016
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000731 : LUT4
    generic map(
      INIT => X"4A44"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(0),
      I2 => a_2(3),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000073
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_91 : LUT4
    generic map(
      INIT => X"FF76"
    )
    port map (
      I0 => a_2(0),
      I1 => BU2_N104,
      I2 => a_2(2),
      I3 => a_2(1),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_91_91
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_91_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(4),
      O => BU2_N104
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_9 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_N102,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000031_183,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_9_132
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_9_SW0 : LUT4
    generic map(
      INIT => X"C852"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(2),
      I2 => a_2(1),
      I3 => a_2(3),
      O => BU2_N102
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000041 : LUT4
    generic map(
      INIT => X"1112"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(0),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00004
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000271 : LUT4
    generic map(
      INIT => X"D9DA"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(0),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000027
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001081 : LUT4
    generic map(
      INIT => X"4900"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000108
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_SW0 : LUT4
    generic map(
      INIT => X"AF9B"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(0),
      I2 => a_2(2),
      I3 => a_2(3),
      O => BU2_N92
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000090 : LUT4
    generic map(
      INIT => X"6876"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000090_147
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00009031 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(1),
      I2 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000057
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000331 : LUT4
    generic map(
      INIT => X"5592"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000033
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000401 : LUT4
    generic map(
      INIT => X"0161"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000040
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001131 : LUT4
    generic map(
      INIT => X"7364"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000113
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001071 : LUT4
    generic map(
      INIT => X"1292"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000107
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000131 : LUT4
    generic map(
      INIT => X"BB64"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000013
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000082 : LUT4
    generic map(
      INIT => X"0923"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00008
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000741 : LUT4
    generic map(
      INIT => X"4682"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(3),
      I2 => a_2(1),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000074
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_11_SW0 : LUT4
    generic map(
      INIT => X"BAB8"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(1),
      I2 => a_2(2),
      I3 => a_2(0),
      O => BU2_N100
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000109 : LUT4
    generic map(
      INIT => X"3464"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(2),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000109_174
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000022 : LUT4
    generic map(
      INIT => X"AEB9"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(1),
      I2 => a_2(2),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000022_59
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000931 : LUT4
    generic map(
      INIT => X"3FB6"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      I2 => a_2(1),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000093
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000089 : LUT4
    generic map(
      INIT => X"2109"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(1),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000089_146
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00008425 : LUT4
    generic map(
      INIT => X"9956"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(1),
      I2 => a_2(0),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000084
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000024 : LUT4
    generic map(
      INIT => X"9D96"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      I2 => a_2(1),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000024_61
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000211 : LUT4
    generic map(
      INIT => X"841E"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(0),
      I2 => a_2(1),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000021
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000010 : LUT4
    generic map(
      INIT => X"498A"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(0),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000010_39
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_11 : LUT4
    generic map(
      INIT => X"90FF"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      I2 => a_2(4),
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_11_101
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_10_SW0 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      I2 => a_2(1),
      O => BU2_N78
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00008413 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(0),
      I2 => a_2(1),
      O => BU2_N25
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00009011 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(2),
      I2 => a_2(1),
      O => BU2_N10
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000681 : LUT4
    generic map(
      INIT => X"0602"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      I2 => a_2(1),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000068
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8 : LUT4
    generic map(
      INIT => X"43FF"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(2),
      I2 => a_2(4),
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_178
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000411 : LUT4
    generic map(
      INIT => X"5FE4"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(0),
      I2 => a_2(2),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000041_87
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000361 : LUT4
    generic map(
      INIT => X"2262"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(1),
      I2 => a_2(2),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000036
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000381 : LUT4
    generic map(
      INIT => X"02E2"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(1),
      I2 => a_2(3),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000038
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000481 : LUT4
    generic map(
      INIT => X"2406"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(1),
      I2 => a_2(3),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000048
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000071 : LUT3
    generic map(
      INIT => X"94"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(1),
      I2 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00007
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000811 : LUT4
    generic map(
      INIT => X"F7B6"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(2),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000081
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000701 : LUT4
    generic map(
      INIT => X"5576"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(1),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000070
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000631 : LUT4
    generic map(
      INIT => X"2042"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(1),
      I2 => a_2(2),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000063
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001141 : LUT4
    generic map(
      INIT => X"F820"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(1),
      I2 => a_2(2),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000114
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000251 : LUT4
    generic map(
      INIT => X"BBFD"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(2),
      I2 => a_2(0),
      I3 => a_2(1),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000025
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000321 : LUT4
    generic map(
      INIT => X"5979"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(1),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000032
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000941 : LUT4
    generic map(
      INIT => X"7655"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000094
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000601 : LUT4
    generic map(
      INIT => X"1898"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000060
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000201 : LUT4
    generic map(
      INIT => X"7B63"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(1),
      I2 => a_2(2),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000020
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000851 : LUT4
    generic map(
      INIT => X"AFBD"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(1),
      I2 => a_2(2),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000085
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000391 : LUT4
    generic map(
      INIT => X"8222"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(1),
      I2 => a_2(2),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000039
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000015 : LUT4
    generic map(
      INIT => X"5581"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(0),
      I2 => a_2(1),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000015_46
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000291 : LUT4
    generic map(
      INIT => X"7B79"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(1),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000029
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_11_SW0 : LUT4
    generic map(
      INIT => X"8212"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_N80
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001101 : LUT4
    generic map(
      INIT => X"3AB6"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      I2 => a_2(1),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000110
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000011 : LUT4
    generic map(
      INIT => X"2904"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(1),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000014 : LUT4
    generic map(
      INIT => X"012B"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000014_45
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_102 : LUT4
    generic map(
      INIT => X"8E9F"
    )
    port map (
      I0 => a_2(4),
      I1 => a_2(2),
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047,
      I3 => BU2_N25,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_102_165
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00003931 : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(0),
      I2 => a_2(2),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000049
    );
  BU2_a_8_112 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(1),
      I2 => BU2_N39,
      O => BU2_N24
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_101 : LUT4
    generic map(
      INIT => X"8ADF"
    )
    port map (
      I0 => a_2(4),
      I1 => a_2(2),
      I2 => BU2_N25,
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000105,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_101_166
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_9 : LUT4
    generic map(
      INIT => X"2227"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000096,
      I2 => BU2_N56,
      I3 => BU2_N10,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_9_156
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_91 : LUT4
    generic map(
      INIT => X"8ADF"
    )
    port map (
      I0 => a_2(4),
      I1 => a_2(1),
      I2 => a_2(0),
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000077,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_91_131
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8 : LUT4
    generic map(
      INIT => X"DF8A"
    )
    port map (
      I0 => a_2(4),
      I1 => a_2(1),
      I2 => a_2(0),
      I3 => BU2_N92,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_93
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_11 : LUT4
    generic map(
      INIT => X"8ADF"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_N01,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047,
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000036,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_11_80
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_9 : LUT4
    generic map(
      INIT => X"2227"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000031_183,
      I2 => BU2_N56,
      I3 => BU2_N10,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_9_71
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f51 : LUT4
    generic map(
      INIT => X"FF1F"
    )
    port map (
      I0 => BU2_N14,
      I1 => a_2(4),
      I2 => a_2(0),
      I3 => a_2(1),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f52
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000281 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(0),
      I2 => a_2(1),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000028
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000031 : LUT4
    generic map(
      INIT => X"4859"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00003
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001111 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(2),
      I2 => a_2(0),
      I3 => a_2(1),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000011_40
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000911 : LUT4
    generic map(
      INIT => X"20AA"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(0),
      I2 => a_2(3),
      I3 => a_2(1),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000091
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_10 : LUT4
    generic map(
      INIT => X"FF1F"
    )
    port map (
      I0 => BU2_N14,
      I1 => a_2(4),
      I2 => a_2(0),
      I3 => a_2(1),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_10_130
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000971 : LUT4
    generic map(
      INIT => X"7C79"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000097
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000921 : LUT4
    generic map(
      INIT => X"55C8"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(0),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000092
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000121 : LUT4
    generic map(
      INIT => X"3879"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000012
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001121 : LUT4
    generic map(
      INIT => X"2605"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(0),
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000112
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000212 : LUT4
    generic map(
      INIT => X"A8AC"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(2),
      I2 => a_2(1),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00002
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000231 : LUT4
    generic map(
      INIT => X"4101"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000023
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_101 : LUT4
    generic map(
      INIT => X"1735"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047,
      I2 => a_2(3),
      I3 => BU2_N11,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_101_103
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000261 : LUT4
    generic map(
      INIT => X"5D49"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(3),
      I2 => a_2(2),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000026
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000772 : LUT4
    generic map(
      INIT => X"5706"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000077
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000065 : LUT4
    generic map(
      INIT => X"2001"
    )
    port map (
      I0 => a_2(0),
      I1 => a_2(1),
      I2 => a_2(2),
      I3 => a_2(3),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00006
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000961 : LUT3
    generic map(
      INIT => X"BD"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(1),
      I2 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000096
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000671 : LUT4
    generic map(
      INIT => X"5584"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000067
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_11 : LUT4
    generic map(
      INIT => X"085D"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_N14,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000105,
      I3 => BU2_N80,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_11_164
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_101 : LUT4
    generic map(
      INIT => X"5F1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000057,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000063,
      I3 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_101_124
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_92 : LUT4
    generic map(
      INIT => X"111B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000042,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000105,
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_92_85
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8 : LUT4
    generic map(
      INIT => X"04FF"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      I2 => a_2(4),
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_112
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_91 : LUT4
    generic map(
      INIT => X"3233"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047,
      I2 => a_2(3),
      I3 => BU2_N11,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_91_110
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_102 : LUT4
    generic map(
      INIT => X"3233"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000049,
      I2 => a_2(0),
      I3 => BU2_N28,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_102_102
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_10 : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_N29,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047,
      I3 => BU2_N78,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_10_90
    );
  BU2_a_8_21 : LUT4
    generic map(
      INIT => X"444F"
    )
    port map (
      I0 => a_2(2),
      I1 => BU2_N24,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_5_f7_77,
      I3 => a_2(8),
      O => spo_3(3)
    );
  BU2_a_8_41 : LUT4
    generic map(
      INIT => X"888F"
    )
    port map (
      I0 => BU2_N11,
      I1 => BU2_N39,
      I2 => a_2(8),
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_5_f7_116,
      O => spo_3(5)
    );
  BU2_a_8_61 : LUT4
    generic map(
      INIT => X"888F"
    )
    port map (
      I0 => a_2(2),
      I1 => BU2_N24,
      I2 => a_2(8),
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_5_f7_161,
      O => spo_3(7)
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000981 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000047
    );
  BU2_a_8_1 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => a_2(8),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_5_f7_19,
      O => spo_3(1)
    );
  BU2_a_8_11 : LUT4
    generic map(
      INIT => X"444F"
    )
    port map (
      I0 => a_2(2),
      I1 => BU2_N24,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_5_f7_50,
      I3 => a_2(8),
      O => spo_3(2)
    );
  BU2_a_8_411 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      O => BU2_N11
    );
  BU2_a_8_51 : LUT4
    generic map(
      INIT => X"888F"
    )
    port map (
      I0 => BU2_N11,
      I1 => BU2_N39,
      I2 => a_2(8),
      I3 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_5_f7_137,
      O => spo_3(6)
    );
  BU2_a_8_31 : LUT3
    generic map(
      INIT => X"AB"
    )
    port map (
      I0 => BU2_N24,
      I1 => a_2(8),
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_5_f7_98,
      O => spo_3(4)
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00002411 : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      O => BU2_N01
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001051 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(1),
      I2 => a_2(2),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000105
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000010211 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(3),
      O => BU2_N14
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000030_SW0 : LUT4
    generic map(
      INIT => X"AF8A"
    )
    port map (
      I0 => a_2(2),
      I1 => a_2(0),
      I2 => a_2(3),
      I3 => a_2(1),
      O => BU2_N56
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00003921 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(2),
      I2 => a_2(0),
      O => BU2_N29
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00007711 : LUT4
    generic map(
      INIT => X"5504"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000042
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000951 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(2),
      I2 => a_2(1),
      O => BU2_N28
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000099 : LUT4
    generic map(
      INIT => X"2460"
    )
    port map (
      I0 => a_2(1),
      I1 => a_2(2),
      I2 => a_2(3),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00009
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000311 : LUT4
    generic map(
      INIT => X"1735"
    )
    port map (
      I0 => a_2(3),
      I1 => a_2(2),
      I2 => a_2(1),
      I3 => a_2(0),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000031_183
    );
  BU2_a_8_111 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => a_2(8),
      I1 => a_2(7),
      I2 => a_2(6),
      I3 => BU2_N48,
      O => BU2_N39
    );
  BU2_a_8_111_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => a_2(5),
      I1 => a_2(4),
      I2 => a_2(3),
      O => BU2_N48
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_9 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000113,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000114,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_9_177
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_7_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_9_177,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_178,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_7_f5_171
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_91 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000011_40,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000112,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_91_173
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_10 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000109_174,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000110,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_10_172
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_10_172,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_91_173,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_f5_170
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_6_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_f5_170,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_7_f5_171,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_6_f6_160
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_92 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000107,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000108,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_92_167
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_f5_0 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_101_166,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_92_167,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_f51
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_9_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_11_164,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_102_165,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_9_f5_162
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_7_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_9_f5_162,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_8_f51,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_7_f6_159
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_5_f7 : MUXF7
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_7_f6_159,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_6_f6_160,
      S => a_2(7),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001181_5_f7_161
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000097,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000081,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_157
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_7_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_9_156,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_157,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_7_f5_150
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_91 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000028,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000094,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_91_152
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_10 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000092,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000093,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_10_151
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_10_151,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_91_152,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_f5_149
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_6_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_f5_149,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_7_f5_150,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_6_f6_136
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_92 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000090_147,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000091,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_92_145
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_101 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000028,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000089_146,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_101_144
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_f5_0 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_101_144,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_92_145,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_f51
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_102 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000029,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000070,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_102_141
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_11 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000084,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000085,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_11_140
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_9_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_11_140,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_102_141,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_9_f5_138
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_7_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_9_f5_138,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_8_f51,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_7_f6_135
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_5_f7 : MUXF7
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_7_f6_135,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_6_f6_136,
      S => a_2(7),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001001_5_f7_137
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000029,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000081,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_133
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_7_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_9_132,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_133,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_7_f5_129
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_10_130,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_91_131,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_f5_128
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_6_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_f5_128,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_7_f5_129,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_6_f6_115
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_92 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000073,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000074,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_92_125
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_f5_0 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_101_124,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_92_125,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_f51
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_102 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000041_87,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000070,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_102_120
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_11 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000067,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000068,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_11_119
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_9_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_11_119,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_102_120,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_9_f5_117
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_7_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_9_f5_117,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_8_f51,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_7_f6_114
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_5_f7 : MUXF7
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_7_f6_114,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_6_f6_115,
      S => a_2(7),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000831_5_f7_116
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_9 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000063,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000049,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_9_111
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_7_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_9_111,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_112,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_7_f5_108
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f52,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_91_110,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f5_107
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_6_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f5_107,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_7_f5_108,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_6_f6_97
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_92 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000036,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000060,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_92_104
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f5_0 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_101_103,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_92_104,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f51_100
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_9_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_11_101,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_102_102,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_9_f5_99
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_7_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_9_f5_99,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_8_f51_100,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_7_f6_96
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_5_f7 : MUXF7
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_7_f6_96,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_6_f6_97,
      S => a_2(7),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000661_5_f7_98
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_9 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000048,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000049,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_9_92
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_7_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_9_92,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_93,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_7_f5_89
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_10_90,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_91_91,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_f5_88
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_6_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_f5_88,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_7_f5_89,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_6_f6_76
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_101 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000040,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000041_87,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_101_84
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_f5_0 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_101_84,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_92_85,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_f51
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_102 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000038,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000039,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_102_81
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_9_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_11_80,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_102_81,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_9_f5_78
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_7_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_9_f5_78,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_8_f51,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_7_f6_75
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_5_f7 : MUXF7
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_7_f6_75,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_6_f6_76,
      S => a_2(7),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000521_5_f7_77
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000032,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000033,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_72
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_7_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_9_71,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_72,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_7_f5_64
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_91 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000028,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000029,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_91_66
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_10 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000026,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000027,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_10_65
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_10_65,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_91_66,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_f5_63
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_6_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_f5_63,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_7_f5_64,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_6_f6_49
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_92 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000024_61,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000025,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_92_58
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_101 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000022_59,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000023,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_101_57
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_f5_0 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_101_57,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_92_58,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_f51
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_102 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000020,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000021,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_102_54
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_9_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_11_53,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_102_54,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_9_f5_51
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_7_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_9_f5_51,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_8_f51,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_7_f6_48
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_5_f7 : MUXF7
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_7_f6_48,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_6_f6_49,
      S => a_2(7),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000351_5_f7_50
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000015_46,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000016,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_43
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_9 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000013,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000014_45,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_9_42
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_7_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_9_42,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_43,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_7_f5_35
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_91 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000011_40,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000012,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_91_37
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_10 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00009,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom000010_39,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_10_36
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_10_36,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_91_37,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_f5_34
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_6_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_f5_34,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_7_f5_35,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_6_f6_18
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_92 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00007,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00008,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_92_29
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_101 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000105,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00006,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_101_28
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_f5_0 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_101_28,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_92_29,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_f51
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_102 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00003,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00004,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_102_23
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_11 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => a_2(4),
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00001,
      I2 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom00002,
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_11_22
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_9_f5 : MUXF5
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_11_22,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_102_23,
      S => a_2(5),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_9_f5_20
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_7_f6 : MUXF6
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_9_f5_20,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_8_f51,
      S => a_2(6),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_7_f6_17
    );
  BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_5_f7 : MUXF7
    port map (
      I0 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_7_f6_17,
      I1 => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_6_f6_18,
      S => a_2(7),
      O => BU2_U0_gen_rom_rom_inst_Mrom_spo_int_rom0000171_5_f7_19
    );
  BU2_XST_GND : GND
    port map (
      G => spo_3(0)
    );

end STRUCTURE;

-- synthesis translate_on
