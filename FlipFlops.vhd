library IEEE;
use IEEE.std_logic_1164.ALL;

entity FlipFlops is
  Port(clk,rst,Q : in std_logic;
        D,T : out std_logic);
end entity FlipFlops;

architecture RTL of FlipFlops is
  signal S : std_logic := '0';   --Signal for the T ff
  begin
    process (clk, rst)
      begin
        if rising_edge(rst) then --Async reset
          D<='0';
          S<='0';
        end if;
        if Q='1' then
          T<= not S;    --T ff: Toggles if Q=1
        end if;
        D<=Q;           --D ff: Takes the value of Q
      end process;
end architecture RTL;
