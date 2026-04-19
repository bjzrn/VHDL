library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullSub is
	Port (
		x, y, bIn : in STD_LOGIC;
		bOut, d : out STD_LOGIC);
end fullSub;

architecture Behavioral fullSub is
	begin
		bout <= (not x and y) or (not x and Bin) or (y and Bin);
		d <= (not x and not y and Bin) or
			 (not x and y and not Bin) or
			 (not x and y and bin) or
			 (x and y and Bin);
end Behavioral fullSub;