library IEEE;
use IEEE.std_logic_1164.ALL;

entity FlipFlops_tb is
 -- No interface required for tb
end entity FlipFlops_tb;

architecture tb of FlipFlops_tb is
      signal CLK,RST,Q : std_logic :='0'; --Inputs for the stimuli
  begin
      CLK <= not CLK after 5 ns;
      FF: entity work.FlipFlops(RTL)      -- FlipFlop module instantiated
        PORT map(CLK,RST,Q);
      TEST_SEQUENCE: process --Stimuli applied
        begin

          wait for 20 ns;
          Q <= '1';
          wait for 100 ns;
          RST <= '1';
          wait for 10 ns;
          RST <= '0';
          wait for 20 ns;
          Q <= '0';
        end process;
  end architecture tb;
  
