library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch_Controller is
	Port(clk, sys_reset, button1, button2: in std_logic; 
		run, reset_watch: out std_logic);
		
		type state is (zero, start, running, stop, stopped, reset);
		
end stopwatch_Controller;

architecture Behavioral of stopwatch_Controller is

	signal current_state: state;
	signal next_state: state;
	
	begin
		process(clk)
			begin 
			  if rising_edge(clk) then 
				if sys_reset = '0' then
					current_state <= zero;
				else
					current_state <= next_state; 
				end if;
			  end if; 
		end process; 
		
		process(current_state, button1, button2)
			begin 
				case current_state is 
					when zero => 
						if button1 = '1' then 
							next_state <= start; 
						else 
							next_state <= current_state; 
						end if;
							
					when start => 
						if button1 = '0' and button2 = '0' then 
							next_state <= running; 
						else 
							next_state <= current_state;
						end if;
							
				   when running => 
						if button1 = '1' then 
							next_state <= stop; 
						else 
							next_state <= current_state;
						end if;
							
					when stop => 
						if button1 = '0' and button2 = '0' then 
							next_state <= stopped;
						else 
							next_state <= current_state; 
						end if;
							
					when stopped => 
						if button1 = '1' then
							next_state <= start; 
						elsif 
							button1 = '0' and button2 = '1' then 
							next_state <= reset; 
						else 
							next_state <= current_state;
						end if;
							
					when reset => 
						if button1 = '0' and button2 = '0' then 
							next_state <= zero; 					
						else
							next_state <= current_state;
						end if;		

				end case;
		end process;
		
			with current_state select run <= 
					'1' when start | running,
					'0' when others; 
			
			with current_state select reset_watch <= 
					'1' when reset,
					'0' when others; 
end Behavioral;
