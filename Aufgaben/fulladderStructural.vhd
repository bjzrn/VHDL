library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladderStructural is
    Port (
        a   : in  STD_LOGIC;
        b   : in  STD_LOGIC;
        cIn : in  STD_LOGIC;
        s   : out STD_LOGIC;
        cOut: out STD_LOGIC);
end fulladderStructural;

architecture Structural of fulladderStructural is
	component XOR_Gate
		port (i, j : in STD_LOGIC; o : out STD_LOGIC);
	end component;
	
	component AND_Gate
		port (i, j : in STD_LOGIC; o : out STD_LOGIC);
	end component;
	
	component OR_Gate
		port (i, j : in STD_LOGIC; o : out STD_LOGIC);
	end component;

	signal xorOut1, andOut1, andOut2: STD_LOGIC;
	
begin 
	G1: XOR_Gate port map(i => a, j => b, o => xorOut1);
	G2: AND_Gate port map(i => a, j => b, o => andOut1);
	G3: XOR_Gate port map(i => cIn, j => xorOut1, o => s);
	G4: AND_Gate port map(i => xorOut1, j => cIn, o => andOut2);
	G5: OR_Gate port map(i => andOut1, j => andOut2, o => cOut);
	
end Structural;
