library ieee;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;
USE ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity main_led_panel is
	generic( data_len : integer := 2048;
				column : integer := 64;
				addr_port: integer := 4);
	port(
		CLK, RST, data_from_com: in std_logic;
	   ADDRESS : out std_logic_vector (addr_port-1 downto 0);
		SCLK , LATCH, BLANK : out std_logic;
		R0, G0, B0, R1, G1, B1 : out std_logic);
end main_led_panel;

architecture behave of main_led_panel  is 

	component rs232_rx is
	generic(
		system_speed : integer := 50e6;
		baudrate : integer := 9600);
	port(
		clk_i : in std_logic;
		rst_i : in std_logic;
		req_o : out std_logic := '0';
		data_o : out std_logic_vector(7 downto 0);
		rx : in std_logic);
	end component;
	
	component ledpanel is
	generic( data_len : integer := 2048;
				column : integer := 64;
				addr_port: integer := 4);
	port(
		CLK, START : in std_logic;
		req_rx: in std_logic;
		data_in : in std_logic_vector(7 downto 0);
		ADDRESS : out std_logic_vector (3 downto 0);
		SCLK , LATCH, BLANK : out std_logic;
		R0, G0, B0, R1, G1, B1 : out std_logic);
	end component;
	
component ram is
	port(
			clk, req_rx: in std_logic;
			data : in std_logic_vector(7 downto 0);
			ADDRESS : out std_logic_vector (3 downto 0);
			SCLK , LATCH, BLANK : out std_logic;
			R0, G0, B0, R1, G1, B1 : out std_logic);
end component;
	
	component edge_detector is
	port (clk, bt_in: in std_logic;
			bt_out: out std_logic:= '0');
	end component;
	
signal req_out: std_logic;
signal req_out_edge : std_logic;
signal data_out: std_logic_vector(7 downto 0);
signal R, G, B : std_logic_vector(2047 downto 0);


begin
	u0 : RAM
		port map(CLK, req_out_edge, data_out, ADDRESS, SCLK, LATCH, BLANK, R0, G0, B0, R1, G1, B1);
	u1 : rs232_rx
		port map(CLK, RST, req_out, data_out, data_from_com);
--	u2 : ledpanel
--		port map(CLK, '1', req_out_edge, data_out, ADDRESS, SCLK, LATCH, BLANK, R0, G0, B0, R1, G1, B1);
	u3 : edge_detector
		port map(CLK, req_out, req_out_edge);

		
end behave;