library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity async4BitCounter is
	Port (
		clk, reset : in STD_LOGIC;
		count : out STD_LOGIC_VECTOR(3 downto 0)
		);
end async4BitCounter;

architecture Behavioral of async4BitCounter is
	signal counter : unsigned(3 downto 0) := (others => '0');
	
begin
	process(reset, clk)
	begin
		if reset = '0' then
			counter <= (others => '0');
		elsif rising_edge(clk) then
			counter <= counter + 1;
		end if;
	end process;
	
	count <= STD_LOGIC_VECTOR(counter);
end Behavioral async4BitCounter;