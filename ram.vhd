library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity ram is
	port(
			clk, req_rx: in std_logic;
			data : in std_logic_vector(7 downto 0);
			ADDRESS : out std_logic_vector (3 downto 0);
			SCLK , LATCH, BLANK : out std_logic;
			R0, G0, B0, R1, G1, B1 : out std_logic);
end ram;
	architecture behave of ram is
		type state_type is(
		start_byte,address_byte,
		receive_pixelR,receive_pixelG,receive_pixelB,
		plus_index);
		signal state : state_type := start_byte;
		--subtype byte is std_logic_vector(2047 downto 0);
		signal R : std_logic_vector(2047 downto 0);
		signal G : std_logic_vector(2047 downto 0);
		signal B : std_logic_vector(2047 downto 0);
		--type mem is array(0 to 2) of byte;
		--signal ram3x2048: mem;
		signal index : integer range 0 to 63 := 63;
		signal addr : integer;
		signal addr_temp : std_logic_vector(7 downto 0);
	begin
	

	LED : entity work.ledpanel 
	generic map( data_len => 2048,
				column => 64,
				addr_port => 4)
	port map(
		CLK => CLK,
		START => '1',
		DATA_R => R ,
		DATA_G => G, 
		DATA_B => B,
		ADDRESS => ADDRESS,
		SCLK => SCLK, 
		LATCH => LATCH, 
		BLANK => BLANK,
		R0 => R0,
		G0 => G0,
		B0 => B0,
		R1 => R1,
		G1 => G1,
		B1 => B1);


		process(clk)
			begin
				if rising_edge(clk) then
					case state is
						when start_byte =>
							if (req_rx = '1') then
								if data = x"23" then
									state <= receive_pixelR;
								end if;
							end if;
						when address_byte =>
							if (req_rx ='1') then
								addr <=  to_integer(unsigned(data))*32;
							end if;
						when receive_pixelR =>
							if (req_rx ='1') then
								R(index+addr) <= data(0);
								state <= receive_pixelG;
							end if;
						when receive_pixelG =>
							if (req_rx ='1') then
								G(index+addr) <= data(0);
								state <= receive_pixelB;
							end if;
						when receive_pixelB =>
							if (req_rx ='1') then
								B(index+addr) <= data(0);
								state <= plus_index;
							end if;
						when plus_index =>
							if index > 0 then
								index <= index - 1;
								state <= receive_pixelR;
							else
								index <= 63;
								state <= start_byte;

							end if;
					end case;
				end if;
		end process;
		
	
end behave;