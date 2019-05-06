----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:23 04/28/2019 
-- Design Name: 
-- Module Name:    ALUControl - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUControl is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           Instruction5_0 : in  STD_LOGIC_VECTOR (5 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is
signal or0_and0_output: STD_LOGIC;
signal tmp: STD_LOGIC;
begin
	or0_and0_output <= (Instruction5_0(0) OR Instruction5_0(3)) AND ALUOp(1);
	Operation(1)<= NOT(Instruction5_0(2)) OR NOT(ALUOp(1));
	Operation(2)<= (Instruction5_0(1) AND ALUOp(1)) OR ALUOp(0);
	tmp <= (Instruction5_0(0) AND Instruction5_0(1)) AND ALUOp(1);
	Operation(3)<= tmp;
	Operation(0)<= or0_and0_output AND NOT(tmp);
end Behavioral;

