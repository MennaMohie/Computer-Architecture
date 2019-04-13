----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:44 04/12/2019 
-- Design Name: 
-- Module Name:    ALU0 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.COMPONENTS.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU0_CMP is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           aluop : in  STD_LOGIC_VECTOR(3 downto 0);
           less : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           result : out  STD_LOGIC);
end ALU0_CMP;

architecture Behavioral of ALU0_CMP is
signal operand1: STD_LOGIC;
signal operand2: STD_LOGIC;
signal addition_res: STD_LOGIC_VECTOR(1 downto 0);
signal temp_res: STD_LOGIC_VECTOR(0 downto 0);
begin
	mux_a: MUX 
		GENERIC MAP(numOfSelectors=> 1, numOfBits=> 1)
		PORT MAP (I=> (NOT(a))&a, S(0)=> aluop(3), O(0)=> operand1);
	mux_b: MUX
		GENERIC MAP(numOfSelectors=>1, numOfBits=>1)
		PORT MAP (I=> (NOT(b))&b, S(0)=> aluop(2), O(0)=> operand2);
	addition_res<= ('0'&operand1) + ('0'&operand2) + ('0'&cin);
	cout<= addition_res(1);
	mux_op: MUX
		GENERIC MAP(numOfSelectors=>2, numOfBits=>1)
		PORT MAP (I=> less& --11 SLT
						  addition_res(0)& --10 ADD/SUB
						  (operand1 OR operand2)&  --01 OR
						  (operand1 AND operand2), --00 AND  
					S=> aluop(1 downto 0), --selector
					O=> temp_res);
	result<= temp_res(0);
end Behavioral;

