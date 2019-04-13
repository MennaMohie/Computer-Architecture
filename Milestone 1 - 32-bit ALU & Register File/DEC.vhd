----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEC is
generic(numOfSelectors:natural:=2);
port(
	-- I: SELECTOR
	I: IN STD_LOGIC_VECTOR(numOfSelectors - 1 downto 0);
	E: IN STD_LOGIC;
	-- el-Output hynawar 1 3nd el-selected 
	O: OUT STD_LOGIC_VECTOR((2 ** numOfSelectors) - 1 downto 0)
);
end DEC;

architecture Behavioral of DEC is
begin
	process(I, E) 
	variable selected_index: integer range 0 to 2 ** numOfSelectors;
	variable temp_output:STD_LOGIC_VECTOR((2 ** numOfSelectors) - 1 downto 0);
	begin
		temp_output:= STD_LOGIC_VECTOR(to_unsigned(0, 2 ** numOfSelectors));
		if(E = '1') THEN
			selected_index:= to_integer(unsigned(I));
			temp_output(selected_index):= '1';
		end if;
		O<= temp_output;
	end process;
end Behavioral;

