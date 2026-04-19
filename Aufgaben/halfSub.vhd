library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfSub is
	Port (
		x, y : in STD_LOGIC;
		b, d : out STD_LOGIC);
end halfSub;

architecture Behavioral of halfSub is
begin
	b <= (not x and y);
	d <= (not x and y) or (x and not y);
end Behavioral halfSub;