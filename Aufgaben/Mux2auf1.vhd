library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux is
    Port (en : in STD_LOGIC;
          s0 : in STD_LOGIC;
          s1 : in STD_LOGIC;
          d0 : in STD_LOGIC;
          d1 : in STD_LOGIC;
          d2 : in STD_LOGIC;
          d3 : in STD_LOGIC;
          q : out STD_LOGIC);
end mux;

architecture Behavioral of mux is
begin
    process(en, s0, d0, d1)
    begin
        if en = '1' then
            if s1 = '1' then
                if s0 = '1' then
                    q <= d3;
                else
                    q <= d2;
                end if;
            else
                if s0 = '1' then
                    q <= d1;
                else
                    q <= d0;
                end if;
            end if;
        else q <= 'X';
        end if;
    end process;
end Behavioral;