library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;
--------------------------------------------------------------------
entity clockTest is
	Port( clk : in std_logic;
			subclk : out std_logic
	);
	end entity clockTest;
--------------------------------------------------------------------
--50MHz clk pin17
--Counts up to 50M to generate a 2Hz sublock
--Output: 2Hz subClock
--------------------------------------------------------------------	
architecture RTL of clockTest is
signal sub_clock : std_logic := '0';
begin
	process(clk)
	variable sub_count : natural range 0 to 50000000;
	begin
		if (rising_edge(clk) AND sub_count<25000000) then
			sub_count:= sub_count+1;
			sub_clock<='1';
		elsif (rising_edge(clk) AND sub_count<50000000)then
			sub_count:=sub_count+1;
			sub_clock<='0';
		elsif(rising_edge(clk) AND sub_count>=50000000)then
			sub_count:=0;
			sub_clock<='1';
		end if;
	end process;
	subclk<=sub_clock;
end architecture RTL;