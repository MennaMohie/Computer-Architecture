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
signal and0_output, and1_output, and2_output, and3_output, and4_output, and5_output, 
			or0_output, or1_output: STD_LOGIC;
begin
	and_0: AND_GENERIC GENERIC MAP(numOfBits=> 6)
							PORT MAP(I=> NOT(Instruction31_25(5))&NOT(Instruction31_25(4))&NOT(Instruction31_25(3))&
							NOT(Instruction31_25(2))&NOT(Instruction31_25(1))&NOT(Instruction31_25(0)),
							O=> and0_output);
	and_1: AND_GENERIC GENERIC MAP(numOfBits=> 6)
							PORT MAP(I=> Instruction31_25(5)&NOT(Instruction31_25(4))&NOT(Instruction31_25(3))&
							NOT(Instruction31_25(2))&Instruction31_25(1)&Instruction31_25(0),
							O=> and1_output);
	and_2: AND_GENERIC GENERIC MAP(numOfBits=> 6)
							PORT MAP(I=> Instruction31_25(5)&NOT(Instruction31_25(4))&Instruction31_25(3)&
							NOT(Instruction31_25(2))&Instruction31_25(1)&Instruction31_25(0),
							O=> and2_output);
	and_3: AND_GENERIC GENERIC MAP(numOfBits=> 6)
							PORT MAP(I=> NOT(Instruction31_25(5))&NOT(Instruction31_25(4))&NOT(Instruction31_25(3))&
							Instruction31_25(2)&NOT(Instruction31_25(1))&NOT(Instruction31_25(0)),
							O=> and3_output);
	
	and_4: AND_GENERIC GENERIC MAP(numOfBits=> 6)
							PORT MAP(I=> NOT(Instruction31_25(5))&NOT(Instruction31_25(4))&NOT(Instruction31_25(3))&
							Instruction31_25(2)&NOT(Instruction31_25(1))&(Instruction31_25(0)),
							O=> and4_output);
	
	and_5: AND_GENERIC GENERIC MAP(numOfBits=> 6)
							PORT MAP(I=> NOT(Instruction31_25(5))&NOT(Instruction31_25(4))&NOT(Instruction31_25(3))&
							NOT(Instruction31_25(2))&Instruction31_25(1)&NOT(Instruction31_25(0)),
							O=> and5_output);
	
	
	or_0: OR_GENERIC GENERIC MAP(numOfBits=> 2)
						  PORT MAP(I=> (and1_output&and2_output), O=> or0_output);
	or_1: OR_GENERIC GENERIC MAP(numOfBits=> 2)
						  PORT MAP(I=> (and0_output&and1_output), O=> or1_output);
	
	RegDst<= and0_output;
	ALUSrc<= or0_output;
	MemtoReg<= and1_output;
	RegWrite<= or1_output;
	MemRead<= and1_output;
	MemWrite<= and2_output;
	BranchEQ<= and3_output;
	BranchNQ<= and4_output;
	Jump<= and5_output; 
	ALUOp(1)<= and0_output;
	ALUOp(0)<= and3_output;
end Behavioral;

