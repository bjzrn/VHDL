library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch is
	Port(clk,reset,run  : in std_logic; 
		 time_out: out std_logic_vector (7 downto 0)); 
		
end stopwatch;

architecture Behavioral of stopwatch is
	signal counter: unsigned (7 downto 0):= (others => '0')
	
		 begin
		 process(clk)
		  begin 
			if rising_edge(clk) then 
				if reset = '0' then 
					counter <= (others => '0'); 
				elsif 
					run = '1' then 
					counter <= counter + 1; 
				end if; 	
			end if;	
		end process; 
		time_out <= std_logic_vector(counter); 
end Behavioral;
