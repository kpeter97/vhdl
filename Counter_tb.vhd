library IEEE;
use IEEE.std_logic_1164.ALL;

entity Counter_tb is
end entity;

architecture tb of Counter_tb is
  signal clk,rst,direc : std_logic := '0';                  --Driver signals
  signal theCount : std_logic_vector (7 downto 0) := x"00";  
  
begin
    CLOCK_GEN: process
    begin
      wait for 5 ns;
      clk <= not clk;
    end process;
      
    UUT: entity work.Counter(Behavioral)
        PORT map(
          clk => clk,
          rst => rst,
          direc => direc,
          theCount => theCount
          );
          
    -----------------------------------------------------------------
    -----------------------------------------------------------------
    
    TEST_SEQUENCE: process
    begin
      rst <= '1';
      wait for 6 ns;
      rst <= '0';
      wait for 25 ns;
      direc <= '1';
      wait for 5 ns;
      direc <= '0'; 
    end process;
      
    

end architecture tb;
    
    
    
