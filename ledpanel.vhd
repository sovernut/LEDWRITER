library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ledpanel is
	generic( data_len : integer := 2048;
				column : integer := 64;
				addr_port: integer := 4);
	port(
		CLK, START : in std_logic;
		DATA_R, DATA_G, DATA_B : in  std_logic_vector(data_len-1 downto 0);
		ADDRESS : out std_logic_vector (addr_port-1 downto 0);
		SCLK , LATCH, BLANK : out std_logic;
		R0, G0, B0, R1, G1, B1 : out std_logic);
end ledpanel;

architecture behave of	ledpanel is
	constant max_addr : integer := (2**(addr_port))-1 ;
	type state_type is (
		s0, s1, s2, s3, s4, s5, s6, s7, s8); 
	signal state : state_type := s0;
	signal delay : integer range 0 to 10 := 0;
	signal addr : integer range 0 to max_addr := 0;
	signal col : integer range 0 to column-1 := 0;
	--signal addr : std_logic_vector(1 downto 0) := (others => '0');
--	signal R : std_logic_vector(2047 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111";
--
--
--
--signal G : std_logic_vector(2047 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000";
--
--
--
--signal B : std_logic_vector(2047 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"1111111111111111111111111111111111111111111111111111111111111111"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000"&
--"0000000000000000000000000000000000000000000000000000000000000000";






	signal reg_r0, reg_g0, reg_b0, reg_r1, reg_g1, reg_b1 : std_logic_vector(column-1 downto 0) := (others => '1');
	
	signal clk_t : std_logic;
	signal count : integer := 0;
	
begin




	reg_r0 <= DATA_R((data_len-1)-(addr*column) downto (data_len-column)-(addr*column));
	reg_r1 <= DATA_R((data_len/2)-1-(addr*column) downto (data_len/2)-column-(addr*column));
	reg_g0 <= DATA_G((data_len-1)-(addr*column) downto (data_len-column)-(addr*column));
	reg_g1 <= DATA_G((data_len/2)-1-(addr*column) downto (data_len/2)-column-(addr*column));
	reg_b0 <= DATA_B((data_len-1)-(addr*column) downto (data_len-column)-(addr*column));
	reg_b1 <= DATA_B((data_len/2)-1-(addr*column) downto (data_len/2)-column-(addr*column));

--	reg_r0 <= "0000000000000000000000111111111111111111111111111111111111111111";
--	reg_r1 <= "0000000000000000000000111111111111111111111111111111111111111111";
--	reg_g0 <= "0000000000000000000000111111111111111111110000000000000000000000";
--	reg_g1 <= "0000000000000000000000111111111111111111110000000000000000000000";
--	reg_b0 <= "1111111111111111111111111111111111111111110000000000000000000000";
--	reg_b1 <= "1111111111111111111111111111111111111111110000000000000000000000";
	
	ADDRESS <= std_logic_vector(to_unsigned(addr-1,addr_port));
	process (CLK) begin
		if rising_edge(CLK) then
			if (count < 100) then
				count <= count +1;
			else
				count <= 0;
				clk_t <= not clk_t;
			end if;
		end if;
	end process;
	
	
	process  (clk_t)
	begin
		if rising_edge(clk_t) then
			case state is
				when s0 => 
					if delay = 5 then
						state <= s1;
						SCLK <= '0';
						col <= 0;
						addr <= 0;
						delay <= 0;
						SCLK <= '0';
						LATCH <= '0';
						BLANK <= '0';
					else 
						delay <= delay+1;
					end if;
				when s1 => 
					SCLK <= '0';
					R0 <= reg_r0(column-1 - col);
					G0 <= reg_g0(column-1 - col);
					B0 <= reg_b0(column-1 - col);
					R1 <= reg_r1(column-1 - col);
					G1 <= reg_g1(column-1 - col);
					B1 <= reg_b1(column-1 - col);
					--LATCH <= '1';
--					R0 <= '1';
--					G0 <= '1';
--					B0 <= '1';
--					R1 <= '1';
--					G1 <= '1';
--					B1 <= '1';
					state <= s2;
				when s2 => 
					SCLK <= '1';
					state <= s3;
				when s3 =>
					SCLK <= '0';
					R0 <= '0';
					G0 <= '0';
					B0 <= '0';
					R1 <= '0';
					G1 <= '0';
					B1 <= '0';
					if col = column-1 then
						col <= 0;
						state <= s4;
					else
						col <= col+1;
						state <= s1;
					end if;
				when s4 => 
					BLANK <= '1';
					state <= s5;
				when s5 =>
					LATCH <= '1';
					state <= s6;
				when s6 =>
					LATCH <= '0';
					state <= s7;
				when s7 =>
					BLANK <= '0';
					LATCH <= '0';
					state <= s8;
--					if delay > 5e3 then 
--						delay <= 0;
--						state <= s0;
--					else 
--						delay <= delay+1;
--					end if;
				when s8 =>
					if addr = max_addr then 
						--state <= s0;
						addr <= 0;
						state <= s0;
					else
						state <= s1;
						addr <= addr+1;
					end if;
--					if col = column-1 then 
--						if addr = max_addr then
--						end if;
--						addr <= addr+1;
--					end if;
--					col <= col+1;
			end case;
		end if;
	end process;
end behave;