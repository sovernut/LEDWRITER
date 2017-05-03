-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "05/03/2017 14:33:14"

-- 
-- Device: Altera EP3C10E144C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	main_led_panel IS
    PORT (
	CLK : IN std_logic;
	RST : IN std_logic;
	data_from_com : IN std_logic;
	ADDRESS : BUFFER std_logic_vector(3 DOWNTO 0);
	SCLK : BUFFER std_logic;
	LATCH : BUFFER std_logic;
	BLANK : BUFFER std_logic;
	R0 : BUFFER std_logic;
	G0 : BUFFER std_logic;
	B0 : BUFFER std_logic;
	R1 : BUFFER std_logic;
	G1 : BUFFER std_logic;
	B1 : BUFFER std_logic
	);
END main_led_panel;

-- Design Ports Information
-- ADDRESS[0]	=>  Location: PIN_104,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- ADDRESS[1]	=>  Location: PIN_105,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- ADDRESS[2]	=>  Location: PIN_110,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- ADDRESS[3]	=>  Location: PIN_106,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- SCLK	=>  Location: PIN_103,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LATCH	=>  Location: PIN_100,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- BLANK	=>  Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- R0	=>  Location: PIN_80,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- G0	=>  Location: PIN_84,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- B0	=>  Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- R1	=>  Location: PIN_83,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- G1	=>  Location: PIN_85,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- B1	=>  Location: PIN_98,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_from_com	=>  Location: PIN_2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RST	=>  Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLK	=>  Location: PIN_22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF main_led_panel IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_data_from_com : std_logic;
SIGNAL ww_ADDRESS : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SCLK : std_logic;
SIGNAL ww_LATCH : std_logic;
SIGNAL ww_BLANK : std_logic;
SIGNAL ww_R0 : std_logic;
SIGNAL ww_G0 : std_logic;
SIGNAL ww_B0 : std_logic;
SIGNAL ww_R1 : std_logic;
SIGNAL ww_G1 : std_logic;
SIGNAL ww_B1 : std_logic;
SIGNAL \u2|clk_t~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_from_com~input_o\ : std_logic;
SIGNAL \RST~input_o\ : std_logic;
SIGNAL \ADDRESS[0]~output_o\ : std_logic;
SIGNAL \ADDRESS[1]~output_o\ : std_logic;
SIGNAL \ADDRESS[2]~output_o\ : std_logic;
SIGNAL \ADDRESS[3]~output_o\ : std_logic;
SIGNAL \SCLK~output_o\ : std_logic;
SIGNAL \LATCH~output_o\ : std_logic;
SIGNAL \BLANK~output_o\ : std_logic;
SIGNAL \R0~output_o\ : std_logic;
SIGNAL \G0~output_o\ : std_logic;
SIGNAL \B0~output_o\ : std_logic;
SIGNAL \R1~output_o\ : std_logic;
SIGNAL \G1~output_o\ : std_logic;
SIGNAL \B1~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \u2|count[0]~32_combout\ : std_logic;
SIGNAL \u2|count[6]~45\ : std_logic;
SIGNAL \u2|count[7]~46_combout\ : std_logic;
SIGNAL \u2|count[7]~47\ : std_logic;
SIGNAL \u2|count[8]~48_combout\ : std_logic;
SIGNAL \u2|count[8]~49\ : std_logic;
SIGNAL \u2|count[9]~50_combout\ : std_logic;
SIGNAL \u2|count[9]~51\ : std_logic;
SIGNAL \u2|count[10]~52_combout\ : std_logic;
SIGNAL \u2|count[10]~53\ : std_logic;
SIGNAL \u2|count[11]~54_combout\ : std_logic;
SIGNAL \u2|count[11]~55\ : std_logic;
SIGNAL \u2|count[12]~56_combout\ : std_logic;
SIGNAL \u2|count[12]~57\ : std_logic;
SIGNAL \u2|count[13]~58_combout\ : std_logic;
SIGNAL \u2|count[13]~59\ : std_logic;
SIGNAL \u2|count[14]~60_combout\ : std_logic;
SIGNAL \u2|count[14]~61\ : std_logic;
SIGNAL \u2|count[15]~62_combout\ : std_logic;
SIGNAL \u2|count[15]~63\ : std_logic;
SIGNAL \u2|count[16]~64_combout\ : std_logic;
SIGNAL \u2|count[16]~65\ : std_logic;
SIGNAL \u2|count[17]~66_combout\ : std_logic;
SIGNAL \u2|count[17]~67\ : std_logic;
SIGNAL \u2|count[18]~68_combout\ : std_logic;
SIGNAL \u2|count[18]~69\ : std_logic;
SIGNAL \u2|count[19]~70_combout\ : std_logic;
SIGNAL \u2|count[19]~71\ : std_logic;
SIGNAL \u2|count[20]~72_combout\ : std_logic;
SIGNAL \u2|count[20]~73\ : std_logic;
SIGNAL \u2|count[21]~74_combout\ : std_logic;
SIGNAL \u2|count[21]~75\ : std_logic;
SIGNAL \u2|count[22]~76_combout\ : std_logic;
SIGNAL \u2|count[22]~77\ : std_logic;
SIGNAL \u2|count[23]~78_combout\ : std_logic;
SIGNAL \u2|count[23]~79\ : std_logic;
SIGNAL \u2|count[24]~80_combout\ : std_logic;
SIGNAL \u2|count[24]~81\ : std_logic;
SIGNAL \u2|count[25]~82_combout\ : std_logic;
SIGNAL \u2|count[25]~83\ : std_logic;
SIGNAL \u2|count[26]~84_combout\ : std_logic;
SIGNAL \u2|count[26]~85\ : std_logic;
SIGNAL \u2|count[27]~86_combout\ : std_logic;
SIGNAL \u2|count[27]~87\ : std_logic;
SIGNAL \u2|count[28]~88_combout\ : std_logic;
SIGNAL \u2|count[28]~89\ : std_logic;
SIGNAL \u2|count[29]~90_combout\ : std_logic;
SIGNAL \u2|count[29]~91\ : std_logic;
SIGNAL \u2|count[30]~92_combout\ : std_logic;
SIGNAL \u2|count[30]~93\ : std_logic;
SIGNAL \u2|count[31]~94_combout\ : std_logic;
SIGNAL \u2|LessThan0~6_combout\ : std_logic;
SIGNAL \u2|LessThan0~4_combout\ : std_logic;
SIGNAL \u2|LessThan0~5_combout\ : std_logic;
SIGNAL \u2|LessThan0~7_combout\ : std_logic;
SIGNAL \u2|LessThan0~8_combout\ : std_logic;
SIGNAL \u2|LessThan0~9_combout\ : std_logic;
SIGNAL \u2|count[0]~33\ : std_logic;
SIGNAL \u2|count[1]~34_combout\ : std_logic;
SIGNAL \u2|count[1]~35\ : std_logic;
SIGNAL \u2|count[2]~36_combout\ : std_logic;
SIGNAL \u2|count[2]~37\ : std_logic;
SIGNAL \u2|count[3]~38_combout\ : std_logic;
SIGNAL \u2|count[3]~39\ : std_logic;
SIGNAL \u2|count[4]~40_combout\ : std_logic;
SIGNAL \u2|count[4]~41\ : std_logic;
SIGNAL \u2|count[5]~42_combout\ : std_logic;
SIGNAL \u2|count[5]~43\ : std_logic;
SIGNAL \u2|count[6]~44_combout\ : std_logic;
SIGNAL \u2|LessThan0~1_combout\ : std_logic;
SIGNAL \u2|LessThan0~2_combout\ : std_logic;
SIGNAL \u2|LessThan0~0_combout\ : std_logic;
SIGNAL \u2|LessThan0~3_combout\ : std_logic;
SIGNAL \u2|clk_t~0_combout\ : std_logic;
SIGNAL \u2|clk_t~feeder_combout\ : std_logic;
SIGNAL \u2|clk_t~q\ : std_logic;
SIGNAL \u2|clk_t~clkctrl_outclk\ : std_logic;
SIGNAL \u2|col[0]~6_combout\ : std_logic;
SIGNAL \u2|col[4]~16\ : std_logic;
SIGNAL \u2|col[5]~17_combout\ : std_logic;
SIGNAL \u2|delay[0]~4_combout\ : std_logic;
SIGNAL \u2|delay~0_combout\ : std_logic;
SIGNAL \u2|delay[3]~1_combout\ : std_logic;
SIGNAL \u2|delay[3]~2_combout\ : std_logic;
SIGNAL \u2|delay~3_combout\ : std_logic;
SIGNAL \u2|Equal0~0_combout\ : std_logic;
SIGNAL \u2|Selector18~0_combout\ : std_logic;
SIGNAL \u2|addr[3]~0_combout\ : std_logic;
SIGNAL \u2|Add0~3_combout\ : std_logic;
SIGNAL \u2|Selector17~0_combout\ : std_logic;
SIGNAL \u2|Selector16~0_combout\ : std_logic;
SIGNAL \u2|Selector0~0_combout\ : std_logic;
SIGNAL \u2|Selector0~1_combout\ : std_logic;
SIGNAL \u2|state.s0~q\ : std_logic;
SIGNAL \u2|Selector1~1_combout\ : std_logic;
SIGNAL \u2|Selector1~2_combout\ : std_logic;
SIGNAL \u2|state.s1~q\ : std_logic;
SIGNAL \u2|state.s2~q\ : std_logic;
SIGNAL \u2|state.s3~feeder_combout\ : std_logic;
SIGNAL \u2|state.s3~q\ : std_logic;
SIGNAL \u2|col[3]~8_combout\ : std_logic;
SIGNAL \u2|Equal1~0_combout\ : std_logic;
SIGNAL \u2|Selector1~0_combout\ : std_logic;
SIGNAL \u2|col[0]~7\ : std_logic;
SIGNAL \u2|col[1]~9_combout\ : std_logic;
SIGNAL \u2|col[1]~10\ : std_logic;
SIGNAL \u2|col[2]~11_combout\ : std_logic;
SIGNAL \u2|col[2]~12\ : std_logic;
SIGNAL \u2|col[3]~13_combout\ : std_logic;
SIGNAL \u2|col[3]~14\ : std_logic;
SIGNAL \u2|col[4]~15_combout\ : std_logic;
SIGNAL \u2|Selector4~0_combout\ : std_logic;
SIGNAL \u2|state.s4~q\ : std_logic;
SIGNAL \u2|state.s5~q\ : std_logic;
SIGNAL \u2|state.s6~q\ : std_logic;
SIGNAL \u2|state.s7~q\ : std_logic;
SIGNAL \u2|state.s8~q\ : std_logic;
SIGNAL \u2|Selector19~0_combout\ : std_logic;
SIGNAL \u2|Add0~0_combout\ : std_logic;
SIGNAL \u2|Add0~1_combout\ : std_logic;
SIGNAL \u2|Add0~2_combout\ : std_logic;
SIGNAL \u2|Selector9~0_combout\ : std_logic;
SIGNAL \u2|Selector9~1_combout\ : std_logic;
SIGNAL \u2|Selector9~2_combout\ : std_logic;
SIGNAL \u2|SCLK~q\ : std_logic;
SIGNAL \u2|Selector20~0_combout\ : std_logic;
SIGNAL \u2|Selector20~1_combout\ : std_logic;
SIGNAL \u2|LATCH~q\ : std_logic;
SIGNAL \u2|Selector21~0_combout\ : std_logic;
SIGNAL \u2|Selector21~1_combout\ : std_logic;
SIGNAL \u2|BLANK~q\ : std_logic;
SIGNAL \u2|Mux63~0_combout\ : std_logic;
SIGNAL \u2|Selector27~0_combout\ : std_logic;
SIGNAL \u2|R0~q\ : std_logic;
SIGNAL \u2|Mux191~0_combout\ : std_logic;
SIGNAL \u2|Selector23~0_combout\ : std_logic;
SIGNAL \u2|G0~q\ : std_logic;
SIGNAL \u2|Mux319~0_combout\ : std_logic;
SIGNAL \u2|Selector24~0_combout\ : std_logic;
SIGNAL \u2|B0~q\ : std_logic;
SIGNAL \u2|addr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u2|delay\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u2|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \u2|col\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \u2|ALT_INV_state.s0~q\ : std_logic;
SIGNAL \u2|ALT_INV_Add0~2_combout\ : std_logic;
SIGNAL \u2|ALT_INV_Add0~1_combout\ : std_logic;
SIGNAL \u2|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \u2|ALT_INV_addr\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \u2|ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \u2|ALT_INV_Selector9~0_combout\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_RST <= RST;
ww_data_from_com <= data_from_com;
ADDRESS <= ww_ADDRESS;
SCLK <= ww_SCLK;
LATCH <= ww_LATCH;
BLANK <= ww_BLANK;
R0 <= ww_R0;
G0 <= ww_G0;
B0 <= ww_B0;
R1 <= ww_R1;
G1 <= ww_G1;
B1 <= ww_B1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\u2|clk_t~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u2|clk_t~q\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
\u2|ALT_INV_state.s0~q\ <= NOT \u2|state.s0~q\;
\u2|ALT_INV_Add0~2_combout\ <= NOT \u2|Add0~2_combout\;
\u2|ALT_INV_Add0~1_combout\ <= NOT \u2|Add0~1_combout\;
\u2|ALT_INV_Add0~0_combout\ <= NOT \u2|Add0~0_combout\;
\u2|ALT_INV_addr\(0) <= NOT \u2|addr\(0);
\u2|ALT_INV_Selector1~0_combout\ <= NOT \u2|Selector1~0_combout\;
\u2|ALT_INV_Selector9~0_combout\ <= NOT \u2|Selector9~0_combout\;

-- Location: IOOBUF_X34_Y18_N2
\ADDRESS[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|ALT_INV_addr\(0),
	devoe => ww_devoe,
	o => \ADDRESS[0]~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\ADDRESS[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|ALT_INV_Add0~0_combout\,
	devoe => ww_devoe,
	o => \ADDRESS[1]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\ADDRESS[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|ALT_INV_Add0~1_combout\,
	devoe => ww_devoe,
	o => \ADDRESS[2]~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\ADDRESS[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|ALT_INV_Add0~2_combout\,
	devoe => ww_devoe,
	o => \ADDRESS[3]~output_o\);

-- Location: IOOBUF_X34_Y18_N16
\SCLK~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|SCLK~q\,
	devoe => ww_devoe,
	o => \SCLK~output_o\);

-- Location: IOOBUF_X34_Y17_N2
\LATCH~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|LATCH~q\,
	devoe => ww_devoe,
	o => \LATCH~output_o\);

-- Location: IOOBUF_X34_Y17_N16
\BLANK~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|BLANK~q\,
	devoe => ww_devoe,
	o => \BLANK~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\R0~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|R0~q\,
	devoe => ww_devoe,
	o => \R0~output_o\);

-- Location: IOOBUF_X34_Y9_N16
\G0~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|G0~q\,
	devoe => ww_devoe,
	o => \G0~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\B0~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|B0~q\,
	devoe => ww_devoe,
	o => \B0~output_o\);

-- Location: IOOBUF_X34_Y9_N23
\R1~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|B0~q\,
	devoe => ww_devoe,
	o => \R1~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\G1~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|G0~q\,
	devoe => ww_devoe,
	o => \G1~output_o\);

-- Location: IOOBUF_X34_Y17_N23
\B1~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u2|R0~q\,
	devoe => ww_devoe,
	o => \B1~output_o\);

-- Location: IOIBUF_X0_Y11_N1
\CLK~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G4
\CLK~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: LCCOMB_X11_Y14_N0
\u2|count[0]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[0]~32_combout\ = \u2|count\(0) $ (VCC)
-- \u2|count[0]~33\ = CARRY(\u2|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(0),
	datad => VCC,
	combout => \u2|count[0]~32_combout\,
	cout => \u2|count[0]~33\);

-- Location: LCCOMB_X11_Y14_N12
\u2|count[6]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[6]~44_combout\ = (\u2|count\(6) & (\u2|count[5]~43\ $ (GND))) # (!\u2|count\(6) & (!\u2|count[5]~43\ & VCC))
-- \u2|count[6]~45\ = CARRY((\u2|count\(6) & !\u2|count[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(6),
	datad => VCC,
	cin => \u2|count[5]~43\,
	combout => \u2|count[6]~44_combout\,
	cout => \u2|count[6]~45\);

-- Location: LCCOMB_X11_Y14_N14
\u2|count[7]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[7]~46_combout\ = (\u2|count\(7) & (!\u2|count[6]~45\)) # (!\u2|count\(7) & ((\u2|count[6]~45\) # (GND)))
-- \u2|count[7]~47\ = CARRY((!\u2|count[6]~45\) # (!\u2|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(7),
	datad => VCC,
	cin => \u2|count[6]~45\,
	combout => \u2|count[7]~46_combout\,
	cout => \u2|count[7]~47\);

-- Location: FF_X11_Y14_N15
\u2|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[7]~46_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(7));

-- Location: LCCOMB_X11_Y14_N16
\u2|count[8]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[8]~48_combout\ = (\u2|count\(8) & (\u2|count[7]~47\ $ (GND))) # (!\u2|count\(8) & (!\u2|count[7]~47\ & VCC))
-- \u2|count[8]~49\ = CARRY((\u2|count\(8) & !\u2|count[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(8),
	datad => VCC,
	cin => \u2|count[7]~47\,
	combout => \u2|count[8]~48_combout\,
	cout => \u2|count[8]~49\);

-- Location: FF_X11_Y14_N17
\u2|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[8]~48_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(8));

-- Location: LCCOMB_X11_Y14_N18
\u2|count[9]~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[9]~50_combout\ = (\u2|count\(9) & (!\u2|count[8]~49\)) # (!\u2|count\(9) & ((\u2|count[8]~49\) # (GND)))
-- \u2|count[9]~51\ = CARRY((!\u2|count[8]~49\) # (!\u2|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(9),
	datad => VCC,
	cin => \u2|count[8]~49\,
	combout => \u2|count[9]~50_combout\,
	cout => \u2|count[9]~51\);

-- Location: FF_X11_Y14_N19
\u2|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[9]~50_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(9));

-- Location: LCCOMB_X11_Y14_N20
\u2|count[10]~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[10]~52_combout\ = (\u2|count\(10) & (\u2|count[9]~51\ $ (GND))) # (!\u2|count\(10) & (!\u2|count[9]~51\ & VCC))
-- \u2|count[10]~53\ = CARRY((\u2|count\(10) & !\u2|count[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(10),
	datad => VCC,
	cin => \u2|count[9]~51\,
	combout => \u2|count[10]~52_combout\,
	cout => \u2|count[10]~53\);

-- Location: FF_X11_Y14_N21
\u2|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[10]~52_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(10));

-- Location: LCCOMB_X11_Y14_N22
\u2|count[11]~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[11]~54_combout\ = (\u2|count\(11) & (!\u2|count[10]~53\)) # (!\u2|count\(11) & ((\u2|count[10]~53\) # (GND)))
-- \u2|count[11]~55\ = CARRY((!\u2|count[10]~53\) # (!\u2|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(11),
	datad => VCC,
	cin => \u2|count[10]~53\,
	combout => \u2|count[11]~54_combout\,
	cout => \u2|count[11]~55\);

-- Location: FF_X11_Y14_N23
\u2|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[11]~54_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(11));

-- Location: LCCOMB_X11_Y14_N24
\u2|count[12]~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[12]~56_combout\ = (\u2|count\(12) & (\u2|count[11]~55\ $ (GND))) # (!\u2|count\(12) & (!\u2|count[11]~55\ & VCC))
-- \u2|count[12]~57\ = CARRY((\u2|count\(12) & !\u2|count[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(12),
	datad => VCC,
	cin => \u2|count[11]~55\,
	combout => \u2|count[12]~56_combout\,
	cout => \u2|count[12]~57\);

-- Location: FF_X11_Y14_N25
\u2|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[12]~56_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(12));

-- Location: LCCOMB_X11_Y14_N26
\u2|count[13]~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[13]~58_combout\ = (\u2|count\(13) & (!\u2|count[12]~57\)) # (!\u2|count\(13) & ((\u2|count[12]~57\) # (GND)))
-- \u2|count[13]~59\ = CARRY((!\u2|count[12]~57\) # (!\u2|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(13),
	datad => VCC,
	cin => \u2|count[12]~57\,
	combout => \u2|count[13]~58_combout\,
	cout => \u2|count[13]~59\);

-- Location: FF_X11_Y14_N27
\u2|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[13]~58_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(13));

-- Location: LCCOMB_X11_Y14_N28
\u2|count[14]~60\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[14]~60_combout\ = (\u2|count\(14) & (\u2|count[13]~59\ $ (GND))) # (!\u2|count\(14) & (!\u2|count[13]~59\ & VCC))
-- \u2|count[14]~61\ = CARRY((\u2|count\(14) & !\u2|count[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(14),
	datad => VCC,
	cin => \u2|count[13]~59\,
	combout => \u2|count[14]~60_combout\,
	cout => \u2|count[14]~61\);

-- Location: FF_X11_Y14_N29
\u2|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[14]~60_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(14));

-- Location: LCCOMB_X11_Y14_N30
\u2|count[15]~62\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[15]~62_combout\ = (\u2|count\(15) & (!\u2|count[14]~61\)) # (!\u2|count\(15) & ((\u2|count[14]~61\) # (GND)))
-- \u2|count[15]~63\ = CARRY((!\u2|count[14]~61\) # (!\u2|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(15),
	datad => VCC,
	cin => \u2|count[14]~61\,
	combout => \u2|count[15]~62_combout\,
	cout => \u2|count[15]~63\);

-- Location: FF_X11_Y14_N31
\u2|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[15]~62_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(15));

-- Location: LCCOMB_X11_Y13_N0
\u2|count[16]~64\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[16]~64_combout\ = (\u2|count\(16) & (\u2|count[15]~63\ $ (GND))) # (!\u2|count\(16) & (!\u2|count[15]~63\ & VCC))
-- \u2|count[16]~65\ = CARRY((\u2|count\(16) & !\u2|count[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(16),
	datad => VCC,
	cin => \u2|count[15]~63\,
	combout => \u2|count[16]~64_combout\,
	cout => \u2|count[16]~65\);

-- Location: FF_X11_Y13_N1
\u2|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[16]~64_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(16));

-- Location: LCCOMB_X11_Y13_N2
\u2|count[17]~66\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[17]~66_combout\ = (\u2|count\(17) & (!\u2|count[16]~65\)) # (!\u2|count\(17) & ((\u2|count[16]~65\) # (GND)))
-- \u2|count[17]~67\ = CARRY((!\u2|count[16]~65\) # (!\u2|count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(17),
	datad => VCC,
	cin => \u2|count[16]~65\,
	combout => \u2|count[17]~66_combout\,
	cout => \u2|count[17]~67\);

-- Location: FF_X11_Y13_N3
\u2|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[17]~66_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(17));

-- Location: LCCOMB_X11_Y13_N4
\u2|count[18]~68\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[18]~68_combout\ = (\u2|count\(18) & (\u2|count[17]~67\ $ (GND))) # (!\u2|count\(18) & (!\u2|count[17]~67\ & VCC))
-- \u2|count[18]~69\ = CARRY((\u2|count\(18) & !\u2|count[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(18),
	datad => VCC,
	cin => \u2|count[17]~67\,
	combout => \u2|count[18]~68_combout\,
	cout => \u2|count[18]~69\);

-- Location: FF_X11_Y13_N5
\u2|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[18]~68_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(18));

-- Location: LCCOMB_X11_Y13_N6
\u2|count[19]~70\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[19]~70_combout\ = (\u2|count\(19) & (!\u2|count[18]~69\)) # (!\u2|count\(19) & ((\u2|count[18]~69\) # (GND)))
-- \u2|count[19]~71\ = CARRY((!\u2|count[18]~69\) # (!\u2|count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(19),
	datad => VCC,
	cin => \u2|count[18]~69\,
	combout => \u2|count[19]~70_combout\,
	cout => \u2|count[19]~71\);

-- Location: FF_X11_Y13_N7
\u2|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[19]~70_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(19));

-- Location: LCCOMB_X11_Y13_N8
\u2|count[20]~72\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[20]~72_combout\ = (\u2|count\(20) & (\u2|count[19]~71\ $ (GND))) # (!\u2|count\(20) & (!\u2|count[19]~71\ & VCC))
-- \u2|count[20]~73\ = CARRY((\u2|count\(20) & !\u2|count[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(20),
	datad => VCC,
	cin => \u2|count[19]~71\,
	combout => \u2|count[20]~72_combout\,
	cout => \u2|count[20]~73\);

-- Location: FF_X11_Y13_N9
\u2|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[20]~72_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(20));

-- Location: LCCOMB_X11_Y13_N10
\u2|count[21]~74\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[21]~74_combout\ = (\u2|count\(21) & (!\u2|count[20]~73\)) # (!\u2|count\(21) & ((\u2|count[20]~73\) # (GND)))
-- \u2|count[21]~75\ = CARRY((!\u2|count[20]~73\) # (!\u2|count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(21),
	datad => VCC,
	cin => \u2|count[20]~73\,
	combout => \u2|count[21]~74_combout\,
	cout => \u2|count[21]~75\);

-- Location: FF_X11_Y13_N11
\u2|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[21]~74_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(21));

-- Location: LCCOMB_X11_Y13_N12
\u2|count[22]~76\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[22]~76_combout\ = (\u2|count\(22) & (\u2|count[21]~75\ $ (GND))) # (!\u2|count\(22) & (!\u2|count[21]~75\ & VCC))
-- \u2|count[22]~77\ = CARRY((\u2|count\(22) & !\u2|count[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(22),
	datad => VCC,
	cin => \u2|count[21]~75\,
	combout => \u2|count[22]~76_combout\,
	cout => \u2|count[22]~77\);

-- Location: FF_X11_Y13_N13
\u2|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[22]~76_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(22));

-- Location: LCCOMB_X11_Y13_N14
\u2|count[23]~78\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[23]~78_combout\ = (\u2|count\(23) & (!\u2|count[22]~77\)) # (!\u2|count\(23) & ((\u2|count[22]~77\) # (GND)))
-- \u2|count[23]~79\ = CARRY((!\u2|count[22]~77\) # (!\u2|count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(23),
	datad => VCC,
	cin => \u2|count[22]~77\,
	combout => \u2|count[23]~78_combout\,
	cout => \u2|count[23]~79\);

-- Location: FF_X11_Y13_N15
\u2|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[23]~78_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(23));

-- Location: LCCOMB_X11_Y13_N16
\u2|count[24]~80\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[24]~80_combout\ = (\u2|count\(24) & (\u2|count[23]~79\ $ (GND))) # (!\u2|count\(24) & (!\u2|count[23]~79\ & VCC))
-- \u2|count[24]~81\ = CARRY((\u2|count\(24) & !\u2|count[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(24),
	datad => VCC,
	cin => \u2|count[23]~79\,
	combout => \u2|count[24]~80_combout\,
	cout => \u2|count[24]~81\);

-- Location: FF_X11_Y13_N17
\u2|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[24]~80_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(24));

-- Location: LCCOMB_X11_Y13_N18
\u2|count[25]~82\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[25]~82_combout\ = (\u2|count\(25) & (!\u2|count[24]~81\)) # (!\u2|count\(25) & ((\u2|count[24]~81\) # (GND)))
-- \u2|count[25]~83\ = CARRY((!\u2|count[24]~81\) # (!\u2|count\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(25),
	datad => VCC,
	cin => \u2|count[24]~81\,
	combout => \u2|count[25]~82_combout\,
	cout => \u2|count[25]~83\);

-- Location: FF_X11_Y13_N19
\u2|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[25]~82_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(25));

-- Location: LCCOMB_X11_Y13_N20
\u2|count[26]~84\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[26]~84_combout\ = (\u2|count\(26) & (\u2|count[25]~83\ $ (GND))) # (!\u2|count\(26) & (!\u2|count[25]~83\ & VCC))
-- \u2|count[26]~85\ = CARRY((\u2|count\(26) & !\u2|count[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(26),
	datad => VCC,
	cin => \u2|count[25]~83\,
	combout => \u2|count[26]~84_combout\,
	cout => \u2|count[26]~85\);

-- Location: FF_X11_Y13_N21
\u2|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[26]~84_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(26));

-- Location: LCCOMB_X11_Y13_N22
\u2|count[27]~86\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[27]~86_combout\ = (\u2|count\(27) & (!\u2|count[26]~85\)) # (!\u2|count\(27) & ((\u2|count[26]~85\) # (GND)))
-- \u2|count[27]~87\ = CARRY((!\u2|count[26]~85\) # (!\u2|count\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(27),
	datad => VCC,
	cin => \u2|count[26]~85\,
	combout => \u2|count[27]~86_combout\,
	cout => \u2|count[27]~87\);

-- Location: FF_X11_Y13_N23
\u2|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[27]~86_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(27));

-- Location: LCCOMB_X11_Y13_N24
\u2|count[28]~88\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[28]~88_combout\ = (\u2|count\(28) & (\u2|count[27]~87\ $ (GND))) # (!\u2|count\(28) & (!\u2|count[27]~87\ & VCC))
-- \u2|count[28]~89\ = CARRY((\u2|count\(28) & !\u2|count[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(28),
	datad => VCC,
	cin => \u2|count[27]~87\,
	combout => \u2|count[28]~88_combout\,
	cout => \u2|count[28]~89\);

-- Location: FF_X11_Y13_N25
\u2|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[28]~88_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(28));

-- Location: LCCOMB_X11_Y13_N26
\u2|count[29]~90\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[29]~90_combout\ = (\u2|count\(29) & (!\u2|count[28]~89\)) # (!\u2|count\(29) & ((\u2|count[28]~89\) # (GND)))
-- \u2|count[29]~91\ = CARRY((!\u2|count[28]~89\) # (!\u2|count\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(29),
	datad => VCC,
	cin => \u2|count[28]~89\,
	combout => \u2|count[29]~90_combout\,
	cout => \u2|count[29]~91\);

-- Location: FF_X11_Y13_N27
\u2|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[29]~90_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(29));

-- Location: LCCOMB_X11_Y13_N28
\u2|count[30]~92\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[30]~92_combout\ = (\u2|count\(30) & (\u2|count[29]~91\ $ (GND))) # (!\u2|count\(30) & (!\u2|count[29]~91\ & VCC))
-- \u2|count[30]~93\ = CARRY((\u2|count\(30) & !\u2|count[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(30),
	datad => VCC,
	cin => \u2|count[29]~91\,
	combout => \u2|count[30]~92_combout\,
	cout => \u2|count[30]~93\);

-- Location: FF_X11_Y13_N29
\u2|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[30]~92_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(30));

-- Location: LCCOMB_X11_Y13_N30
\u2|count[31]~94\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[31]~94_combout\ = \u2|count\(31) $ (\u2|count[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(31),
	cin => \u2|count[30]~93\,
	combout => \u2|count[31]~94_combout\);

-- Location: FF_X11_Y13_N31
\u2|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[31]~94_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(31));

-- Location: LCCOMB_X10_Y14_N26
\u2|LessThan0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~6_combout\ = (!\u2|count\(25) & (!\u2|count\(23) & (!\u2|count\(26) & !\u2|count\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(25),
	datab => \u2|count\(23),
	datac => \u2|count\(26),
	datad => \u2|count\(24),
	combout => \u2|LessThan0~6_combout\);

-- Location: LCCOMB_X10_Y14_N14
\u2|LessThan0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~4_combout\ = (!\u2|count\(16) & (!\u2|count\(15) & (!\u2|count\(17) & !\u2|count\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(16),
	datab => \u2|count\(15),
	datac => \u2|count\(17),
	datad => \u2|count\(18),
	combout => \u2|LessThan0~4_combout\);

-- Location: LCCOMB_X10_Y14_N8
\u2|LessThan0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~5_combout\ = (!\u2|count\(19) & (!\u2|count\(21) & (!\u2|count\(20) & !\u2|count\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(19),
	datab => \u2|count\(21),
	datac => \u2|count\(20),
	datad => \u2|count\(22),
	combout => \u2|LessThan0~5_combout\);

-- Location: LCCOMB_X10_Y14_N10
\u2|LessThan0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~7_combout\ = (!\u2|count\(28) & (!\u2|count\(29) & (!\u2|count\(30) & !\u2|count\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(28),
	datab => \u2|count\(29),
	datac => \u2|count\(30),
	datad => \u2|count\(27),
	combout => \u2|LessThan0~7_combout\);

-- Location: LCCOMB_X10_Y14_N28
\u2|LessThan0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~8_combout\ = (\u2|LessThan0~6_combout\ & (\u2|LessThan0~4_combout\ & (\u2|LessThan0~5_combout\ & \u2|LessThan0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|LessThan0~6_combout\,
	datab => \u2|LessThan0~4_combout\,
	datac => \u2|LessThan0~5_combout\,
	datad => \u2|LessThan0~7_combout\,
	combout => \u2|LessThan0~8_combout\);

-- Location: LCCOMB_X10_Y14_N30
\u2|LessThan0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~9_combout\ = (!\u2|count\(31) & ((!\u2|LessThan0~8_combout\) # (!\u2|LessThan0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(31),
	datac => \u2|LessThan0~3_combout\,
	datad => \u2|LessThan0~8_combout\,
	combout => \u2|LessThan0~9_combout\);

-- Location: FF_X11_Y14_N1
\u2|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[0]~32_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(0));

-- Location: LCCOMB_X11_Y14_N2
\u2|count[1]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[1]~34_combout\ = (\u2|count\(1) & (!\u2|count[0]~33\)) # (!\u2|count\(1) & ((\u2|count[0]~33\) # (GND)))
-- \u2|count[1]~35\ = CARRY((!\u2|count[0]~33\) # (!\u2|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(1),
	datad => VCC,
	cin => \u2|count[0]~33\,
	combout => \u2|count[1]~34_combout\,
	cout => \u2|count[1]~35\);

-- Location: FF_X11_Y14_N3
\u2|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[1]~34_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(1));

-- Location: LCCOMB_X11_Y14_N4
\u2|count[2]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[2]~36_combout\ = (\u2|count\(2) & (\u2|count[1]~35\ $ (GND))) # (!\u2|count\(2) & (!\u2|count[1]~35\ & VCC))
-- \u2|count[2]~37\ = CARRY((\u2|count\(2) & !\u2|count[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(2),
	datad => VCC,
	cin => \u2|count[1]~35\,
	combout => \u2|count[2]~36_combout\,
	cout => \u2|count[2]~37\);

-- Location: FF_X11_Y14_N5
\u2|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[2]~36_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(2));

-- Location: LCCOMB_X11_Y14_N6
\u2|count[3]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[3]~38_combout\ = (\u2|count\(3) & (!\u2|count[2]~37\)) # (!\u2|count\(3) & ((\u2|count[2]~37\) # (GND)))
-- \u2|count[3]~39\ = CARRY((!\u2|count[2]~37\) # (!\u2|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(3),
	datad => VCC,
	cin => \u2|count[2]~37\,
	combout => \u2|count[3]~38_combout\,
	cout => \u2|count[3]~39\);

-- Location: FF_X11_Y14_N7
\u2|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[3]~38_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(3));

-- Location: LCCOMB_X11_Y14_N8
\u2|count[4]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[4]~40_combout\ = (\u2|count\(4) & (\u2|count[3]~39\ $ (GND))) # (!\u2|count\(4) & (!\u2|count[3]~39\ & VCC))
-- \u2|count[4]~41\ = CARRY((\u2|count\(4) & !\u2|count[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|count\(4),
	datad => VCC,
	cin => \u2|count[3]~39\,
	combout => \u2|count[4]~40_combout\,
	cout => \u2|count[4]~41\);

-- Location: FF_X11_Y14_N9
\u2|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[4]~40_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(4));

-- Location: LCCOMB_X11_Y14_N10
\u2|count[5]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|count[5]~42_combout\ = (\u2|count\(5) & (!\u2|count[4]~41\)) # (!\u2|count\(5) & ((\u2|count[4]~41\) # (GND)))
-- \u2|count[5]~43\ = CARRY((!\u2|count[4]~41\) # (!\u2|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(5),
	datad => VCC,
	cin => \u2|count[4]~41\,
	combout => \u2|count[5]~42_combout\,
	cout => \u2|count[5]~43\);

-- Location: FF_X11_Y14_N11
\u2|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[5]~42_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(5));

-- Location: FF_X11_Y14_N13
\u2|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|count[6]~44_combout\,
	sclr => \u2|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|count\(6));

-- Location: LCCOMB_X10_Y14_N16
\u2|LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~1_combout\ = (!\u2|count\(12) & (!\u2|count\(13) & (!\u2|count\(14) & !\u2|count\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(12),
	datab => \u2|count\(13),
	datac => \u2|count\(14),
	datad => \u2|count\(11),
	combout => \u2|LessThan0~1_combout\);

-- Location: LCCOMB_X10_Y14_N4
\u2|LessThan0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~2_combout\ = ((!\u2|count\(2) & (!\u2|count\(3) & !\u2|count\(4)))) # (!\u2|count\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(2),
	datab => \u2|count\(5),
	datac => \u2|count\(3),
	datad => \u2|count\(4),
	combout => \u2|LessThan0~2_combout\);

-- Location: LCCOMB_X10_Y14_N2
\u2|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~0_combout\ = (!\u2|count\(10) & (!\u2|count\(9) & (!\u2|count\(7) & !\u2|count\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(10),
	datab => \u2|count\(9),
	datac => \u2|count\(7),
	datad => \u2|count\(8),
	combout => \u2|LessThan0~0_combout\);

-- Location: LCCOMB_X10_Y14_N22
\u2|LessThan0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|LessThan0~3_combout\ = (\u2|LessThan0~1_combout\ & (\u2|LessThan0~0_combout\ & ((\u2|LessThan0~2_combout\) # (!\u2|count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|count\(6),
	datab => \u2|LessThan0~1_combout\,
	datac => \u2|LessThan0~2_combout\,
	datad => \u2|LessThan0~0_combout\,
	combout => \u2|LessThan0~3_combout\);

-- Location: LCCOMB_X10_Y14_N20
\u2|clk_t~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|clk_t~0_combout\ = \u2|clk_t~q\ $ (((!\u2|count\(31) & ((!\u2|LessThan0~8_combout\) # (!\u2|LessThan0~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|LessThan0~3_combout\,
	datab => \u2|count\(31),
	datac => \u2|clk_t~q\,
	datad => \u2|LessThan0~8_combout\,
	combout => \u2|clk_t~0_combout\);

-- Location: LCCOMB_X10_Y14_N18
\u2|clk_t~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|clk_t~feeder_combout\ = \u2|clk_t~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u2|clk_t~0_combout\,
	combout => \u2|clk_t~feeder_combout\);

-- Location: FF_X10_Y14_N19
\u2|clk_t\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \u2|clk_t~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|clk_t~q\);

-- Location: CLKCTRL_G2
\u2|clk_t~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u2|clk_t~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u2|clk_t~clkctrl_outclk\);

-- Location: LCCOMB_X18_Y13_N18
\u2|col[0]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|col[0]~6_combout\ = \u2|col\(0) $ (VCC)
-- \u2|col[0]~7\ = CARRY(\u2|col\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u2|col\(0),
	datad => VCC,
	combout => \u2|col[0]~6_combout\,
	cout => \u2|col[0]~7\);

-- Location: LCCOMB_X18_Y13_N26
\u2|col[4]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|col[4]~15_combout\ = (\u2|col\(4) & (\u2|col[3]~14\ $ (GND))) # (!\u2|col\(4) & (!\u2|col[3]~14\ & VCC))
-- \u2|col[4]~16\ = CARRY((\u2|col\(4) & !\u2|col[3]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|col\(4),
	datad => VCC,
	cin => \u2|col[3]~14\,
	combout => \u2|col[4]~15_combout\,
	cout => \u2|col[4]~16\);

-- Location: LCCOMB_X18_Y13_N28
\u2|col[5]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|col[5]~17_combout\ = \u2|col\(5) $ (\u2|col[4]~16\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|col\(5),
	cin => \u2|col[4]~16\,
	combout => \u2|col[5]~17_combout\);

-- Location: LCCOMB_X18_Y13_N30
\u2|delay[0]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|delay[0]~4_combout\ = !\u2|delay\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|delay\(0),
	combout => \u2|delay[0]~4_combout\);

-- Location: FF_X18_Y13_N31
\u2|delay[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|delay[0]~4_combout\,
	ena => \u2|ALT_INV_state.s0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|delay\(0));

-- Location: LCCOMB_X18_Y13_N4
\u2|delay~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|delay~0_combout\ = (\u2|delay\(1) & ((\u2|delay\(2) $ (\u2|delay\(0))))) # (!\u2|delay\(1) & (\u2|delay\(2) & ((\u2|delay\(3)) # (!\u2|delay\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|delay\(3),
	datab => \u2|delay\(1),
	datac => \u2|delay\(2),
	datad => \u2|delay\(0),
	combout => \u2|delay~0_combout\);

-- Location: FF_X18_Y13_N5
\u2|delay[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|delay~0_combout\,
	ena => \u2|ALT_INV_state.s0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|delay\(2));

-- Location: LCCOMB_X18_Y13_N10
\u2|delay[3]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|delay[3]~1_combout\ = (\u2|delay\(0) & (\u2|delay\(2) & (!\u2|state.s0~q\ & \u2|delay\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|delay\(0),
	datab => \u2|delay\(2),
	datac => \u2|state.s0~q\,
	datad => \u2|delay\(1),
	combout => \u2|delay[3]~1_combout\);

-- Location: LCCOMB_X19_Y13_N4
\u2|delay[3]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|delay[3]~2_combout\ = \u2|delay\(3) $ (\u2|delay[3]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|delay\(3),
	datad => \u2|delay[3]~1_combout\,
	combout => \u2|delay[3]~2_combout\);

-- Location: FF_X19_Y13_N5
\u2|delay[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|delay[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|delay\(3));

-- Location: LCCOMB_X18_Y13_N16
\u2|delay~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|delay~3_combout\ = (\u2|delay\(1) & (((!\u2|delay\(0))))) # (!\u2|delay\(1) & (\u2|delay\(0) & ((\u2|delay\(3)) # (!\u2|delay\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|delay\(3),
	datab => \u2|delay\(2),
	datac => \u2|delay\(1),
	datad => \u2|delay\(0),
	combout => \u2|delay~3_combout\);

-- Location: FF_X18_Y13_N17
\u2|delay[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|delay~3_combout\,
	ena => \u2|ALT_INV_state.s0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|delay\(1));

-- Location: LCCOMB_X18_Y13_N14
\u2|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Equal0~0_combout\ = (\u2|delay\(0) & (!\u2|delay\(1) & (\u2|delay\(2) & !\u2|delay\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|delay\(0),
	datab => \u2|delay\(1),
	datac => \u2|delay\(2),
	datad => \u2|delay\(3),
	combout => \u2|Equal0~0_combout\);

-- Location: LCCOMB_X19_Y13_N0
\u2|Selector18~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector18~0_combout\ = (\u2|state.s8~q\ & (!\u2|Selector0~0_combout\ & (\u2|addr\(0) $ (\u2|addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|addr\(0),
	datab => \u2|state.s8~q\,
	datac => \u2|addr\(1),
	datad => \u2|Selector0~0_combout\,
	combout => \u2|Selector18~0_combout\);

-- Location: LCCOMB_X19_Y13_N26
\u2|addr[3]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|addr[3]~0_combout\ = (\u2|state.s0~q\ & (\u2|state.s8~q\)) # (!\u2|state.s0~q\ & ((\u2|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|state.s0~q\,
	datab => \u2|state.s8~q\,
	datad => \u2|Equal0~0_combout\,
	combout => \u2|addr[3]~0_combout\);

-- Location: FF_X19_Y13_N1
\u2|addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector18~0_combout\,
	ena => \u2|addr[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|addr\(1));

-- Location: LCCOMB_X19_Y13_N18
\u2|Add0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Add0~3_combout\ = (\u2|addr\(0) & \u2|addr\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u2|addr\(0),
	datad => \u2|addr\(1),
	combout => \u2|Add0~3_combout\);

-- Location: LCCOMB_X19_Y13_N14
\u2|Selector17~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector17~0_combout\ = (\u2|state.s8~q\ & (!\u2|Selector0~0_combout\ & (\u2|Add0~3_combout\ $ (\u2|addr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|Add0~3_combout\,
	datab => \u2|state.s8~q\,
	datac => \u2|addr\(2),
	datad => \u2|Selector0~0_combout\,
	combout => \u2|Selector17~0_combout\);

-- Location: FF_X19_Y13_N15
\u2|addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector17~0_combout\,
	ena => \u2|addr[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|addr\(2));

-- Location: LCCOMB_X19_Y13_N22
\u2|Selector16~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector16~0_combout\ = (\u2|state.s8~q\ & (\u2|addr\(3) $ (((\u2|Add0~3_combout\ & \u2|addr\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|Add0~3_combout\,
	datab => \u2|state.s8~q\,
	datac => \u2|addr\(3),
	datad => \u2|addr\(2),
	combout => \u2|Selector16~0_combout\);

-- Location: FF_X19_Y13_N23
\u2|addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector16~0_combout\,
	ena => \u2|addr[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|addr\(3));

-- Location: LCCOMB_X18_Y13_N12
\u2|Selector0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector0~0_combout\ = (\u2|addr\(0) & (\u2|addr\(1) & (\u2|addr\(2) & \u2|addr\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|addr\(0),
	datab => \u2|addr\(1),
	datac => \u2|addr\(2),
	datad => \u2|addr\(3),
	combout => \u2|Selector0~0_combout\);

-- Location: LCCOMB_X19_Y13_N30
\u2|Selector0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector0~1_combout\ = (\u2|Equal0~0_combout\ & (((!\u2|Selector0~0_combout\)) # (!\u2|state.s8~q\))) # (!\u2|Equal0~0_combout\ & (\u2|state.s0~q\ & ((!\u2|Selector0~0_combout\) # (!\u2|state.s8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|Equal0~0_combout\,
	datab => \u2|state.s8~q\,
	datac => \u2|state.s0~q\,
	datad => \u2|Selector0~0_combout\,
	combout => \u2|Selector0~1_combout\);

-- Location: FF_X19_Y13_N31
\u2|state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|state.s0~q\);

-- Location: LCCOMB_X19_Y13_N24
\u2|Selector1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector1~1_combout\ = (\u2|Equal0~0_combout\ & (((\u2|state.s8~q\ & !\u2|Selector0~0_combout\)) # (!\u2|state.s0~q\))) # (!\u2|Equal0~0_combout\ & (\u2|state.s8~q\ & ((!\u2|Selector0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|Equal0~0_combout\,
	datab => \u2|state.s8~q\,
	datac => \u2|state.s0~q\,
	datad => \u2|Selector0~0_combout\,
	combout => \u2|Selector1~1_combout\);

-- Location: LCCOMB_X19_Y13_N10
\u2|Selector1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector1~2_combout\ = (\u2|Selector1~0_combout\) # (\u2|Selector1~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|Selector1~0_combout\,
	datad => \u2|Selector1~1_combout\,
	combout => \u2|Selector1~2_combout\);

-- Location: FF_X19_Y13_N11
\u2|state.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|state.s1~q\);

-- Location: FF_X23_Y13_N27
\u2|state.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	asdata => \u2|state.s1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|state.s2~q\);

-- Location: LCCOMB_X23_Y13_N0
\u2|state.s3~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|state.s3~feeder_combout\ = \u2|state.s2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|state.s2~q\,
	combout => \u2|state.s3~feeder_combout\);

-- Location: FF_X23_Y13_N1
\u2|state.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|state.s3~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|state.s3~q\);

-- Location: LCCOMB_X18_Y13_N8
\u2|col[3]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|col[3]~8_combout\ = (\u2|state.s0~q\ & ((\u2|state.s3~q\))) # (!\u2|state.s0~q\ & (\u2|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|state.s0~q\,
	datac => \u2|Equal0~0_combout\,
	datad => \u2|state.s3~q\,
	combout => \u2|col[3]~8_combout\);

-- Location: FF_X18_Y13_N29
\u2|col[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|col[5]~17_combout\,
	sclr => \u2|ALT_INV_Selector1~0_combout\,
	ena => \u2|col[3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|col\(5));

-- Location: LCCOMB_X18_Y13_N0
\u2|Equal1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Equal1~0_combout\ = (((!\u2|col\(3)) # (!\u2|col\(1))) # (!\u2|col\(0))) # (!\u2|col\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|col\(2),
	datab => \u2|col\(0),
	datac => \u2|col\(1),
	datad => \u2|col\(3),
	combout => \u2|Equal1~0_combout\);

-- Location: LCCOMB_X18_Y13_N6
\u2|Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector1~0_combout\ = (\u2|state.s3~q\ & (((\u2|Equal1~0_combout\) # (!\u2|col\(4))) # (!\u2|col\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|col\(5),
	datab => \u2|col\(4),
	datac => \u2|state.s3~q\,
	datad => \u2|Equal1~0_combout\,
	combout => \u2|Selector1~0_combout\);

-- Location: FF_X18_Y13_N19
\u2|col[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|col[0]~6_combout\,
	sclr => \u2|ALT_INV_Selector1~0_combout\,
	ena => \u2|col[3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|col\(0));

-- Location: LCCOMB_X18_Y13_N20
\u2|col[1]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|col[1]~9_combout\ = (\u2|col\(1) & (!\u2|col[0]~7\)) # (!\u2|col\(1) & ((\u2|col[0]~7\) # (GND)))
-- \u2|col[1]~10\ = CARRY((!\u2|col[0]~7\) # (!\u2|col\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|col\(1),
	datad => VCC,
	cin => \u2|col[0]~7\,
	combout => \u2|col[1]~9_combout\,
	cout => \u2|col[1]~10\);

-- Location: FF_X18_Y13_N21
\u2|col[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|col[1]~9_combout\,
	sclr => \u2|ALT_INV_Selector1~0_combout\,
	ena => \u2|col[3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|col\(1));

-- Location: LCCOMB_X18_Y13_N22
\u2|col[2]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|col[2]~11_combout\ = (\u2|col\(2) & (\u2|col[1]~10\ $ (GND))) # (!\u2|col\(2) & (!\u2|col[1]~10\ & VCC))
-- \u2|col[2]~12\ = CARRY((\u2|col\(2) & !\u2|col[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u2|col\(2),
	datad => VCC,
	cin => \u2|col[1]~10\,
	combout => \u2|col[2]~11_combout\,
	cout => \u2|col[2]~12\);

-- Location: FF_X18_Y13_N23
\u2|col[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|col[2]~11_combout\,
	sclr => \u2|ALT_INV_Selector1~0_combout\,
	ena => \u2|col[3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|col\(2));

-- Location: LCCOMB_X18_Y13_N24
\u2|col[3]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|col[3]~13_combout\ = (\u2|col\(3) & (!\u2|col[2]~12\)) # (!\u2|col\(3) & ((\u2|col[2]~12\) # (GND)))
-- \u2|col[3]~14\ = CARRY((!\u2|col[2]~12\) # (!\u2|col\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u2|col\(3),
	datad => VCC,
	cin => \u2|col[2]~12\,
	combout => \u2|col[3]~13_combout\,
	cout => \u2|col[3]~14\);

-- Location: FF_X18_Y13_N25
\u2|col[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|col[3]~13_combout\,
	sclr => \u2|ALT_INV_Selector1~0_combout\,
	ena => \u2|col[3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|col\(3));

-- Location: FF_X18_Y13_N27
\u2|col[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|col[4]~15_combout\,
	sclr => \u2|ALT_INV_Selector1~0_combout\,
	ena => \u2|col[3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|col\(4));

-- Location: LCCOMB_X19_Y13_N12
\u2|Selector4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector4~0_combout\ = (\u2|col\(4) & (\u2|col\(5) & (!\u2|Equal1~0_combout\ & \u2|state.s3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|col\(4),
	datab => \u2|col\(5),
	datac => \u2|Equal1~0_combout\,
	datad => \u2|state.s3~q\,
	combout => \u2|Selector4~0_combout\);

-- Location: FF_X19_Y13_N13
\u2|state.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|state.s4~q\);

-- Location: FF_X19_Y13_N27
\u2|state.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	asdata => \u2|state.s4~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|state.s5~q\);

-- Location: FF_X19_Y13_N21
\u2|state.s6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	asdata => \u2|state.s5~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|state.s6~q\);

-- Location: FF_X19_Y13_N7
\u2|state.s7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	asdata => \u2|state.s6~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|state.s7~q\);

-- Location: FF_X19_Y13_N19
\u2|state.s8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	asdata => \u2|state.s7~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|state.s8~q\);

-- Location: LCCOMB_X19_Y13_N8
\u2|Selector19~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector19~0_combout\ = (!\u2|addr\(0) & \u2|state.s8~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|addr\(0),
	datad => \u2|state.s8~q\,
	combout => \u2|Selector19~0_combout\);

-- Location: FF_X19_Y13_N9
\u2|addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector19~0_combout\,
	ena => \u2|addr[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|addr\(0));

-- Location: LCCOMB_X22_Y13_N20
\u2|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Add0~0_combout\ = \u2|addr\(1) $ (\u2|addr\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u2|addr\(1),
	datac => \u2|addr\(0),
	combout => \u2|Add0~0_combout\);

-- Location: LCCOMB_X22_Y13_N2
\u2|Add0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Add0~1_combout\ = \u2|addr\(2) $ (((\u2|addr\(0)) # (\u2|addr\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u2|addr\(0),
	datac => \u2|addr\(1),
	datad => \u2|addr\(2),
	combout => \u2|Add0~1_combout\);

-- Location: LCCOMB_X22_Y13_N24
\u2|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Add0~2_combout\ = \u2|addr\(3) $ (((\u2|addr\(2)) # ((\u2|addr\(1)) # (\u2|addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|addr\(2),
	datab => \u2|addr\(1),
	datac => \u2|addr\(0),
	datad => \u2|addr\(3),
	combout => \u2|Add0~2_combout\);

-- Location: LCCOMB_X23_Y13_N26
\u2|Selector9~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector9~0_combout\ = (!\u2|state.s1~q\ & !\u2|state.s3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|state.s1~q\,
	datad => \u2|state.s3~q\,
	combout => \u2|Selector9~0_combout\);

-- Location: LCCOMB_X22_Y13_N0
\u2|Selector9~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector9~1_combout\ = (\u2|SCLK~q\ & ((\u2|state.s0~q\ & ((\u2|Selector9~0_combout\))) # (!\u2|state.s0~q\ & (!\u2|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|state.s0~q\,
	datab => \u2|SCLK~q\,
	datac => \u2|Equal0~0_combout\,
	datad => \u2|Selector9~0_combout\,
	combout => \u2|Selector9~1_combout\);

-- Location: LCCOMB_X22_Y13_N6
\u2|Selector9~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector9~2_combout\ = (\u2|state.s2~q\) # (\u2|Selector9~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|state.s2~q\,
	datad => \u2|Selector9~1_combout\,
	combout => \u2|Selector9~2_combout\);

-- Location: FF_X22_Y13_N7
\u2|SCLK\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector9~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|SCLK~q\);

-- Location: LCCOMB_X19_Y13_N20
\u2|Selector20~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector20~0_combout\ = (\u2|state.s0~q\ & (!\u2|state.s7~q\ & (!\u2|state.s6~q\))) # (!\u2|state.s0~q\ & (((!\u2|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001001010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|state.s0~q\,
	datab => \u2|state.s7~q\,
	datac => \u2|state.s6~q\,
	datad => \u2|Equal0~0_combout\,
	combout => \u2|Selector20~0_combout\);

-- Location: LCCOMB_X19_Y13_N2
\u2|Selector20~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector20~1_combout\ = (\u2|state.s5~q\) # ((\u2|LATCH~q\ & \u2|Selector20~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|state.s5~q\,
	datac => \u2|LATCH~q\,
	datad => \u2|Selector20~0_combout\,
	combout => \u2|Selector20~1_combout\);

-- Location: FF_X19_Y13_N3
\u2|LATCH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector20~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|LATCH~q\);

-- Location: LCCOMB_X19_Y13_N6
\u2|Selector21~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector21~0_combout\ = (\u2|BLANK~q\ & ((\u2|state.s0~q\ & (!\u2|state.s7~q\)) # (!\u2|state.s0~q\ & ((!\u2|Equal0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|state.s0~q\,
	datab => \u2|BLANK~q\,
	datac => \u2|state.s7~q\,
	datad => \u2|Equal0~0_combout\,
	combout => \u2|Selector21~0_combout\);

-- Location: LCCOMB_X19_Y13_N28
\u2|Selector21~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector21~1_combout\ = (\u2|state.s4~q\) # (\u2|Selector21~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|state.s4~q\,
	datad => \u2|Selector21~0_combout\,
	combout => \u2|Selector21~1_combout\);

-- Location: FF_X19_Y13_N29
\u2|BLANK\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector21~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|BLANK~q\);

-- Location: LCCOMB_X19_Y13_N16
\u2|Mux63~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Mux63~0_combout\ = (\u2|addr\(3) & ((\u2|addr\(2)) # ((\u2|addr\(1) & \u2|addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|addr\(3),
	datab => \u2|addr\(1),
	datac => \u2|addr\(0),
	datad => \u2|addr\(2),
	combout => \u2|Mux63~0_combout\);

-- Location: LCCOMB_X23_Y13_N28
\u2|Selector27~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector27~0_combout\ = (\u2|state.s1~q\ & !\u2|Mux63~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|state.s1~q\,
	datad => \u2|Mux63~0_combout\,
	combout => \u2|Selector27~0_combout\);

-- Location: FF_X23_Y13_N29
\u2|R0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector27~0_combout\,
	ena => \u2|ALT_INV_Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|R0~q\);

-- Location: LCCOMB_X22_Y13_N10
\u2|Mux191~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Mux191~0_combout\ = (\u2|addr\(3) & (!\u2|addr\(2) & ((!\u2|addr\(0)) # (!\u2|addr\(1))))) # (!\u2|addr\(3) & (\u2|addr\(2) & ((\u2|addr\(1)) # (\u2|addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|addr\(3),
	datab => \u2|addr\(1),
	datac => \u2|addr\(0),
	datad => \u2|addr\(2),
	combout => \u2|Mux191~0_combout\);

-- Location: LCCOMB_X23_Y13_N30
\u2|Selector23~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector23~0_combout\ = (\u2|state.s1~q\ & \u2|Mux191~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|state.s1~q\,
	datad => \u2|Mux191~0_combout\,
	combout => \u2|Selector23~0_combout\);

-- Location: FF_X23_Y13_N31
\u2|G0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector23~0_combout\,
	ena => \u2|ALT_INV_Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|G0~q\);

-- Location: LCCOMB_X22_Y13_N12
\u2|Mux319~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Mux319~0_combout\ = (\u2|addr\(3)) # ((\u2|addr\(2) & ((\u2|addr\(1)) # (\u2|addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u2|addr\(3),
	datab => \u2|addr\(1),
	datac => \u2|addr\(0),
	datad => \u2|addr\(2),
	combout => \u2|Mux319~0_combout\);

-- Location: LCCOMB_X23_Y13_N24
\u2|Selector24~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u2|Selector24~0_combout\ = (\u2|state.s1~q\ & \u2|Mux319~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u2|state.s1~q\,
	datad => \u2|Mux319~0_combout\,
	combout => \u2|Selector24~0_combout\);

-- Location: FF_X23_Y13_N25
\u2|B0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u2|clk_t~clkctrl_outclk\,
	d => \u2|Selector24~0_combout\,
	ena => \u2|ALT_INV_Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|B0~q\);

-- Location: IOIBUF_X0_Y23_N8
\data_from_com~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_com,
	o => \data_from_com~input_o\);

-- Location: IOIBUF_X34_Y12_N15
\RST~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST,
	o => \RST~input_o\);

ww_ADDRESS(0) <= \ADDRESS[0]~output_o\;

ww_ADDRESS(1) <= \ADDRESS[1]~output_o\;

ww_ADDRESS(2) <= \ADDRESS[2]~output_o\;

ww_ADDRESS(3) <= \ADDRESS[3]~output_o\;

ww_SCLK <= \SCLK~output_o\;

ww_LATCH <= \LATCH~output_o\;

ww_BLANK <= \BLANK~output_o\;

ww_R0 <= \R0~output_o\;

ww_G0 <= \G0~output_o\;

ww_B0 <= \B0~output_o\;

ww_R1 <= \R1~output_o\;

ww_G1 <= \G1~output_o\;

ww_B1 <= \B1~output_o\;
END structure;


