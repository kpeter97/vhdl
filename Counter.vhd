library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

--8 bit counter 
--Async: reset
--Sync: rising edge on dir changes direction

entity Counter is
  Port(clk,rst,direc : in std_logic;
        theCount : out std_logic_vector (7 downto 0));
end entity Counter;

architecture Behavioral of Counter is
  signal count : std_logic_vector (7 downto 0) := x"00";
  signal DIR : std_logic := '1';
begin
  process(clk,rst,direc)
    begin
                                          --Direction change
      if rising_edge(direc) then
        DIR <= not DIR;
      end if;
                                          --Async Reset
      if rst='1' then
        count <= x"00";
      

                                          --Counting
      elsif rising_edge(clk) then
        
        if DIR='1' AND count = x"FF" then --Resets at overflow otherwise counts
          count<=x"00";
        elsif DIR = '1' then
          count <= count + 1;
          
        elsif DIR='0' AND count=x"00" then
          count <= x"FF";
        elsif DIR='0' then
          count <= count-1;
        end if;
        
      end if;
  end process;
  
  theCount<= count;
  
end architecture Behavioral;