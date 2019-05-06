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
	CLK,LOD,INC,CLR :IN STD_LOGIC;
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

component AND_GENERIC is
GENERIC(numOfBits: natural := 6);
PORT(
	I: IN STD_LOGIC_VECTOR(numOfBits - 1 downto 0);
	O: OUT STD_LOGIC);
end component;

component OR_GENERIC is
GENERIC(numOfBits:natural:= 6);
    Port ( I : in  STD_LOGIC_VECTOR(numOfBits - 1 downto 0);
           O : out  STD_LOGIC);
end component;

component OneBitAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout :out  STD_LOGIC;
           result : out  STD_LOGIC);
end component;

component ALUControl is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           Instruction5_0 : in  STD_LOGIC_VECTOR (5 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component ControlUnit is
    Port ( Instruction31_25 : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           Jump : out  STD_LOGIC;
           BranchEQ : out  STD_LOGIC;
			  BranchNQ : out STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR(1 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end component;

component DATAMEMORY is
  Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port ( LoadIt: in STD_LOGIC;
  			INPUT     : in STD_LOGIC_VECTOR (wordsize-1 downto 0);
			OUTPUT    : out STD_LOGIC_VECTOR (wordsize-1 downto 0);
         MEM_READ : in STD_LOGIC;
			MEM_WRITE : in STD_LOGIC;
			ADDRESS   : in STD_LOGIC_VECTOR (addresssize-1 downto 0);
			CLK       : in STD_LOGIC
			);

end component;

component INSTRMEMORY is
	Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port(
    LoadIt: in Std_logic ;
	 DATA: out STD_LOGIC_VECTOR(wordsize-1 downto 0);
    ADDRESS: in STD_LOGIC_VECTOR(addresssize-1 downto 0);
    CLK: in STD_LOGIC
    );
end component;

component Sign_Extend is
    Port ( I : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0));
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
