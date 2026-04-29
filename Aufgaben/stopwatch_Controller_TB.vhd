library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch_Controller_tb is
end stopwatch_Controller_tb;

architecture Behavioral of stopwatch_Controller_tb is
    component stopwatch_Controller
        Port(
            clk in std_logic;
            sys_reset in std_logic;
            button1 in std_logic;
            button2 in std_logic;
            run out std_logic;
            reset_watch out std_logic
        );
    end component;

    signal clk std_logic = '0';
    signal sys_reset std_logic = '0';
    signal button1 std_logic = '0';
    signal button2 std_logic = '0';
    signal run std_logic;
    signal reset_watch std_logic;

    constant clk_period time = 10 ns;
begin
    uut stopwatch_Controller port map (
        clk = clk,
        sys_reset = sys_reset,
        button1 = button1,
        button2 = button2,
        run = run,
        reset_watch = reset_watch
    );

    clk_process process
    begin
        clk = '0';
        wait for clk_period2;
        clk = '1';
        wait for clk_period2;
    end process;

    stim_proc process
    begin
        sys_reset = '0';
        wait for 20 ns;
        sys_reset = '1';
        wait for 20 ns;

        button1 = '1';
        wait for 20 ns;
        button1 = '0';
        wait for 20 ns;

        button1 = '1';
        wait for 20 ns;
        button1 = '0';
        wait for 20 ns;

        button2 = '1';
        wait for 20 ns;
        button2 = '0';
        wait for 20 ns;

        wait;
    end process;
end Behavioral;