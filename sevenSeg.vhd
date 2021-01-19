library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;


--Driver interface for the single 7 segment display in the Arduino Uno devkit
--Displays number from 0 to 9. The dot in the down right corner is not used

entity sevenSeg is
Port( inNUM : in std_logic_vector (3 downto 0);
		outNUM : out std_logic_vector (6 downto 0));
		end sevenSeg;
		
architecture Behavioral of sevenSeg is
 
 begin
 
 outNUM(0) <= '1' when (to_integer(unsigned(inNUM))=0 
							OR to_integer(unsigned(inNUM))=4
							OR to_integer(unsigned(inNUM))=5
							OR to_integer(unsigned(inNUM))=8
							OR to_integer(unsigned(inNUM))=9
							OR to_integer(unsigned(inNUM))=6) else '0';
 outNUM(1) <= '1' when (to_integer(unsigned(inNUM))=0 
							OR to_integer(unsigned(inNUM))=2
							OR to_integer(unsigned(inNUM))=3
							OR to_integer(unsigned(inNUM))=5
							OR to_integer(unsigned(inNUM))=6
							OR to_integer(unsigned(inNUM))=8
							OR to_integer(unsigned(inNUM))=9
							OR to_integer(unsigned(inNUM))=7) else '0';
 outNUM(2) <= '1' when (to_integer(unsigned(inNUM))=0 
							OR to_integer(unsigned(inNUM))=1
							OR to_integer(unsigned(inNUM))=2
							OR to_integer(unsigned(inNUM))=3
							OR to_integer(unsigned(inNUM))=4
							OR to_integer(unsigned(inNUM))=8
							OR to_integer(unsigned(inNUM))=9
							OR to_integer(unsigned(inNUM))=7) else '0';
 outNUM(3) <= '1' when (to_integer(unsigned(inNUM))=0 
							OR to_integer(unsigned(inNUM))=2
							OR to_integer(unsigned(inNUM))=8
							OR to_integer(unsigned(inNUM))=6) else '0';
 outNUM(4) <= '1' when (to_integer(unsigned(inNUM))=0 
							OR to_integer(unsigned(inNUM))=2
							OR to_integer(unsigned(inNUM))=3
							OR to_integer(unsigned(inNUM))=5
							OR to_integer(unsigned(inNUM))=8
							OR to_integer(unsigned(inNUM))=9
							OR to_integer(unsigned(inNUM))=6) else '0';
 outNUM(5) <= '1' when (to_integer(unsigned(inNUM))=0 
							OR to_integer(unsigned(inNUM))=1
							OR to_integer(unsigned(inNUM))=3
							OR to_integer(unsigned(inNUM))=4
							OR to_integer(unsigned(inNUM))=5
							OR to_integer(unsigned(inNUM))=6
							OR to_integer(unsigned(inNUM))=8
							OR to_integer(unsigned(inNUM))=9
							OR to_integer(unsigned(inNUM))=7) else '0';
 outNUM(6) <= '1' when (to_integer(unsigned(inNUM))=2 
							OR to_integer(unsigned(inNUM))=3
							OR to_integer(unsigned(inNUM))=4
							OR to_integer(unsigned(inNUM))=5
							OR to_integer(unsigned(inNUM))=8
							OR to_integer(unsigned(inNUM))=9
							OR to_integer(unsigned(inNUM))=6) else '0';
 
end Behavioral;
