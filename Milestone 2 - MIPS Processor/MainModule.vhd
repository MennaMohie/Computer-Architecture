----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:46:52 05/01/2019 
-- Design Name: 
-- Module Name:    MainModule - Behavioral 
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
use work.HIGHER_COMPONENTS.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MainModule is
    Port ( START : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RegFileOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RegFileOut2 : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOut : out  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0);
           DataMemOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MainModule;

architecture Behavioral of MainModule is
	signal Instruction: STD_LOGIC_VECTOR(31 downto 0);
	signal AdderResult1: STD_LOGIC_VECTOR(31 downto 0);
	signal AdderResult2: STD_LOGIC_VECTOR(31 downto 0);
	signal AdderCout1, AdderCout2: STD_LOGIC;
	signal WriteAddress: STD_LOGIC_VECTOR(4 downto 0);
	signal PCIn: STD_LOGIC_VECTOR(31 downto 0);
	signal PCOut_tmp : sTD_LOGIC_VECTOR (31 downto 0);
	signal RegFileOut1_tmp : sTD_LOGIC_VECTOR (31 downto 0);
	signal RegFileOut2_tmp : sTD_LOGIC_VECTOR (31 downto 0);
	signal DataMemOut_tmp : sTD_LOGIC_VECTOR (31 downto 0);
	signal Address_ALU: STD_LOGIC_VECTOR(31 downto 0);
	signal signOut: STD_LOGIC_VECTOR(31 downto 0);
	signal ALUIn2: STD_LOGIC_VECTOR(31 downto 0);
	signal ALU_SELECT: STD_LOGIC_VECTOR(3 downto 0);
	signal shft_signOut: STD_LOGIC_VECTOR(31 downto 0);
	signal BranchOrNotMux: STD_LOGIC_VECTOR(31 downto 0);
	signal writeData: STD_LOGIC_VECTOR(31 downto 0);
	signal jumpAddress: STD_LOGIC_VECTOR(31 downto 0);
	signal RegDst: STD_LOGIC;
	signal Jump  : STD_LOGIC;
	signal BranchEQ, BranchNQ, branchMuxSelector: STD_LOGIC;
	signal MemRead: STD_LOGIC;
	signal MemtoReg: STD_LOGIC;
	signal ALUOp : STD_LOGIC_VECTOR(1 downto 0);
	signal MemWrite : STD_LOGIC;
	signal ALUSrc : STD_LOGIC;
	signal RegWrite : STD_LOGIC;
	signal ALUzflag : STD_LOGIC;
	signal ALUcflag : STD_LOGIC;
	signal ALUoflag : STD_LOGIC;
begin
PC: 				REG GENERIC MAP(32) PORT MAP(PCIn, CLK, START, '0', NOT(START), PCOut_tmp);
					PCOut <= PCOut_tmp;
F: 	 			INSTRMEMORY PORT MAP(NOT(START), Instruction, PCOut_tmp, CLK);
Adderr: 			ADDER PORT MAP(PCOut_tmp, "00000000000000000000000000000100", '0', AdderCout1,
										AdderResult1);
CU:				ControlUnit PORT MAP(Instruction(31 downto 26), RegDst, Jump, BranchEQ,
					BranchNQ, MemRead, MemtoReg, ALUop, MemWrite, ALUSrc, RegWrite);
writeAdd: 		MUX GENERIC MAP(numOfSelectors=> 1, numOfBits=> 5)
					PORT MAP (I=>(Instruction(15 downto 11)&Instruction(20 downto 16)),
								S(0)=> RegDst, O=> WriteAddress);
signExtension: Sign_Extend PORT MAP(Instruction(15 downto 0) , signOut);
					shft_signOut(31 downto 0) <= signOut(29 downto 0)&"00";
regfile:			RegisterFile PORT MAP(Instruction(25 downto 21), Instruction(20 downto 16),
										WriteAddress, RegWrite, CLK, writeData,
										RegFileOut1_tmp, RegFileOut2_tmp);
					RegFileOut1 <= RegFileOut1_tmp;
					RegFileOut2 <= RegFileOut2_tmp;
AlUin_2:			MUX GENERIC MAP(numOfSelectors=> 1, numOfBits=> 32)
					PORT MAP (I=> (signOut&RegFileOut2_tmp), S(0)=> ALUSrc, O=> ALUIn2);
ALU_Selector:	ALUControl PORT MAP(ALUOp, Instruction(5 downto 0), ALU_SELECT);
Aluu:				ALU PORT MAP(RegFileOut1_tmp, ALUIn2, ALU_SELECT, '0', Address_ALU,
									ALUcflag, ALUzflag, ALUoflag);
					ALUOut <= Address_ALU;
DMO_file:		DATAMEMORY PORT MAP(NOT(START), RegFileOut2_tmp, DataMemOut_tmp,
											  MemRead, MemWrite, Address_ALU, CLK);
					DataMemOut <= DataMemOut_tmp;
writeData_out:	MUX GENERIC MAP(numOfSelectors=> 1, numOfBits=> 32)
					PORT MAP (I => (DataMemOut_tmp&Address_ALU), S(0)=> MemtoReg, O => WriteData);
branchh:			ADDER PORT MAP(AdderResult1, shft_signOut, '0', AdderCout2, AdderResult2);

					branchMuxSelector <= ((BranchNQ and Not(ALUzflag))or(BranchEQ and ALUzflag)); 

jumpMuxx:		MUX GENERIC MAP(numOfSelectors=> 1, numOfBits=> 32)
					PORT MAP (I=> (AdderResult2&AdderResult1), S(0)=> branchMuxSelector, O=> BranchOrNotMux);
					
					jumpAddress <= (AdderResult1(31 downto 28)&Instruction(25 downto 0)&"00");
jumpOrbranch:	MUX GENERIC MAP(numOfSelectors=> 1, numOfBits=> 32)
					PORT MAP (I=> jumpAddress&BranchOrNotMux, S(0)=> Jump, O=> PCIn);

end Behavioral;

