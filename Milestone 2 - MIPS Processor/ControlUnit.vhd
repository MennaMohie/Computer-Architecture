----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:02:52 04/28/2019 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use work.COMPONENTS.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit is
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
end ControlUnit;

architecture Behavioral of ControlUnit is
signal R_format, lw_format, sw_format, Beq, Bneq, Jmp,
			or0_output, or1_output: STD_LOGIC;
begin
	R_format		<= NOT(Instruction31_25(5)) and NOT(Instruction31_25(4)) and NOT(Instruction31_25(3)) and 
							NOT(Instruction31_25(2)) and NOT(Instruction31_25(1)) and NOT(Instruction31_25(0));
							
	lw_format	<= Instruction31_25(5) and NOT(Instruction31_25(4)) and NOT(Instruction31_25(3)) and 
							NOT(Instruction31_25(2)) and Instruction31_25(1) and Instruction31_25(0);
							
	sw_format	<= Instruction31_25(5) and NOT(Instruction31_25(4)) and Instruction31_25(3) and 
							NOT(Instruction31_25(2)) and Instruction31_25(1) and Instruction31_25(0);
							
	Beq			<= NOT(Instruction31_25(5)) and NOT(Instruction31_25(4)) and NOT(Instruction31_25(3)) and 
							Instruction31_25(2) and NOT(Instruction31_25(1)) and NOT(Instruction31_25(0));
	
	Bneq			<= NOT(Instruction31_25(5)) and NOT(Instruction31_25(4)) and NOT(Instruction31_25(3)) and 
							Instruction31_25(2) and NOT(Instruction31_25(1)) and (Instruction31_25(0));
	
	Jmp			<= NOT(Instruction31_25(5)) and NOT(Instruction31_25(4)) and NOT(Instruction31_25(3)) and 
							NOT(Instruction31_25(2)) and Instruction31_25(1) and NOT(Instruction31_25(0));
	
	
	RegDst<= R_format;
	ALUSrc<= lw_format or sw_format;
	MemtoReg<= lw_format;
	RegWrite<= lw_format or R_format;
	MemRead<= lw_format;
	MemWrite<= sw_format;
	BranchEQ<= Beq;
	BranchNQ<= Bneq;
	Jump<= jmp; 
	ALUOp(1)<= R_format;
	ALUOp(0)<= Beq;
end Behavioral;

