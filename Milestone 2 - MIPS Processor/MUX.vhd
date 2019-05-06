-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.numeric_std.ALL;


entity MUX is
generic(numOfSelectors:natural:=2; numOfBits:natural:=8);
PORT(
	-- I: inputs 2^n, el-Data type el-mafrod ykon vector<NATURAL>, aw Array of STD_LOGIC_VECTOR
	-- El-selkka el-wa7da hat4iel 32 bits
	I: IN STD_LOGIC_VECTOR(((2 ** numOfSelectors) * numOfBits) - 1 downto 0);
	S: IN STD_LOGIC_VECTOR(numOfSelectors - 1 downto 0);
	-- O: selkka wa7da
	O: OUT STD_LOGIC_VECTOR(numOfBits - 1 downto 0)
);
end MUX;

architecture Behavioral of MUX is
begin
	process(I, S) 
	variable selector: integer range 0 to 2 ** numOfSelectors;
	variable start_index: natural range 0 to (2 ** numOfSelectors) * numOfBits - 1;
	variable end_index: natural range 0 to (2 ** numOfSelectors) * numOfBits - 1;
	variable temp_output:STD_LOGIC_VECTOR(numOfBits - 1 downto 0);
	begin
		selector:= to_integer(unsigned(S));
		start_index:= selector * numOfBits;
		end_index:= start_index + numOfBits - 1;
		temp_output:= I(end_index downto start_index);
		O<= temp_output;
	end process;
end Behavioral;

