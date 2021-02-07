library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;
--------------------------------------------------------------------
entity Slider is
	Port( clk : in std_logic;
			btn : in std_logic;
			LED : out std_logic_vector (3 downto 0)
	);
	end entity Slider;
--------------------------------------------------------------------
--When btn is pressed shift left
--When btn is released shift right
--Using 2Hz subclock module
--------------------------------------------------------------------	
architecture RTL of Slider is
signal sub_clock : std_logic := '0';
signal shifter : std_logic_vector (3 downto 0) := "0001";
begin
CLOCK: entity work.clockTest(RTL)
				PORT map (clk => clk,
							subclk => sub_clock);
process(sub_clock)
begin
	if rising_edge(sub_clock) AND btn='0' AND NOT shifter(3)='1' then
		shifter(3 downto 1)<=shifter(2 downto 0);
		shifter(0)<='0';
	elsif rising_edge(sub_clock) AND btn='1' AND NOT shifter(0)='1' then
		shifter(2 downto 0)<=shifter(3 downto 1);
		shifter(3)<='0';
	end if;
end process;		
LED<=shifter;		
end architecture RTL;