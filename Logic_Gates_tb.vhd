library IEEE;
use IEEE.std_logic_1164.ALL;

entity Logic_tb is
  --Interface not required
end entity Logic_tb;

architecture Behavioral of Logic_tb is
  
  signal A,B,C : std_logic := '0'; --Stimuli, initially set to 0
  
begin
  
  LOGICS: entity work.Logic_Gates(RTL) --Logic Gates instantiated
                    PORT map(
                        A,B,C
                      );
                      
  TEST_SEQUENCE: process --Stimuli applied
    begin
      wait for 100 ns;   --Varied for most possible cases
      A <= '1';
      wait for 50 ns;
      B <= '1';
      wait for 50 ns;
      C <= '1';
      wait for 50 ns;
      B <= '0';
      wait for 50 ns;
      A <= '0';
      wait for 50 ns;
      C <= '0';
  end process;
end architecture Behavioral;