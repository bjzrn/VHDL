library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladderBehavioral is
    Port (
        a   : in  STD_LOGIC;
        b   : in  STD_LOGIC;
        cIn : in  STD_LOGIC;
        s   : out STD_LOGIC;
        cOut: out STD_LOGIC);
end fulladderBehavioral;

architecture Behavioral of fulladderBehavioral is
begin
    process(a, b, cIn)
    begin
        if a = '0' then
            if b = '0' then
                if cIn = '0' then
                    s <= '0';
                    cOut <= '0';
                else
                    s <= '1';
                    cOut <= '0';
                end if;
            else
                if cIn = '0' then
                    s <= '1';
                    cOut <= '0';
                else
                    s <= '0';
                    cOut <= '1';
                end if;
            end if;
        else
            if b = '0' then
                if cIn = '0' then
                    s <= '1';
                    cOut <= '0';
                else
                    s <= '0';
                    cOut <= '1';
                end if;
            else
                if cIn = '0' then
                    s <= '0';
                    cOut <= '1';
                else
                    s <= '1';
                    cOut <= '1';
                end if;
            end if;
        end if;
    end process;
end Behavioral;