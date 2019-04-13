library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

package COMPONENTS is

component MUX is
generic(numOfSelectors:natural:=2; numOfBits:natural:=8);
PORT(
	-- I: inputs 2^n, el-Data type el-mafrod ykon vector<NATURAL>, aw Array of STD_LOGIC_VECTOR
	-- El-selkka el-wa7da hat4iel 32 bits
	I: IN STD_LOGIC_VECTOR(((2 ** numOfSelectors) * numOfBits) - 1 downto 0);
	S: IN STD_LOGIC_VECTOR(numOfSelectors - 1 downto 0);
	-- O: selkka wa7da
	O: OUT STD_LOGIC_VECTOR(numOfBits - 1 downto 0)
);
end component;

component REG is 
Generic(n:NATURAL :=4);
PORT(
	I:IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	CLK,LD,INC,CLR :IN STD_LOGIC;
	O:OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end component;

component DEC is 
generic(numOfSelectors:natural:=2);
port(
	-- I: SELECTOR
	I: IN STD_LOGIC_VECTOR(numOfSelectors - 1 downto 0);
	E: IN STD_LOGIC;
	-- el-Output hynawar 1 3nd el-selected 
	O: OUT STD_LOGIC_VECTOR((2 ** numOfSelectors) - 1 downto 0)
);
end component;

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end COMPONENTS;

package body COMPONENTS is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end COMPONENTS;
