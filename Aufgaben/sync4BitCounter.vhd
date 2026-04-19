library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sync4BitCounter is
	Port (
		clk, reset : in STD_LOGIC;
		count : out STD_LOGIC_VECTOR(3 downto 0)
		);
end sync4BitCounter;

architecture Behavioral of sync4BitCounter is
	signal counter : unsigned(3 downto 0) := (others => '0');
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '0' then
				counter <= (others => '0');
			elsif
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	count <= STD_LOGIC_VECTOR(counter);
end Behavioral sync4BitCounter;