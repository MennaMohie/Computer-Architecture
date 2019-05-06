----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:12:11 04/11/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use work.ALU0_ALU31_CMP.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           cflag : out  STD_LOGIC;
           zflag : out  STD_LOGIC;
           oflag : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7, cout8, cout9, cout10,
		 cout11, cout12, cout13, cout14, cout15, cout16, cout17, cout18, cout19, cout20,
		 cout21, cout22, cout23, cout24, cout25, cout26, cout27, cout28, cout29, cout30, cout31,
		 less, set, overflow, tmpSet: STD_LOGIC;
signal result: STD_LOGIC_VECTOR (31 downto 0);
begin
	alu0:  ALU31_CMP PORT MAP(data1(0),  data2(0),  aluop, set, aluop(2), cout0, result(0),  tmpSet, overflow);
	alu1:  ALU31_CMP PORT MAP(data1(1),  data2(1),  aluop, '0', cout0,   cout1,  result(1),  tmpSet, overflow);
	alu2:  ALU31_CMP PORT MAP(data1(2),  data2(2),  aluop, '0', cout1,   cout2,  result(2),  tmpSet, overflow);
	alu3:  ALU31_CMP PORT MAP(data1(3),  data2(3),  aluop, '0', cout2,   cout3,  result(3),  tmpSet, overflow);
	alu4:  ALU31_CMP PORT MAP(data1(4),  data2(4),  aluop, '0', cout3,   cout4,  result(4),  tmpSet, overflow);
	alu5:  ALU31_CMP PORT MAP(data1(5),  data2(5),  aluop, '0', cout4,   cout5,  result(5),  tmpSet, overflow);
	alu6:  ALU31_CMP PORT MAP(data1(6),  data2(6),  aluop, '0', cout5,   cout6,  result(6),  tmpSet, overflow);
	alu7:  ALU31_CMP PORT MAP(data1(7),  data2(7),  aluop, '0', cout6,   cout7,  result(7),  tmpSet, overflow);
	alu8:  ALU31_CMP PORT MAP(data1(8),  data2(8),  aluop, '0', cout7,   cout8,  result(8),  tmpSet, overflow);
	alu9:  ALU31_CMP PORT MAP(data1(7),  data2(7),  aluop, '0', cout8,   cout9,  result(9),  tmpSet, overflow);
	alu10: ALU31_CMP PORT MAP(data1(10), data2(10), aluop, '0', cout9,   cout10, result(10), tmpSet, overflow);
	alu11: ALU31_CMP PORT MAP(data1(11), data2(11), aluop, '0', cout10,  cout11, result(11), tmpSet, overflow);
	alu12: ALU31_CMP PORT MAP(data1(12), data2(12), aluop, '0', cout11,  cout12, result(12), tmpSet, overflow);
	alu13: ALU31_CMP PORT MAP(data1(13), data2(13), aluop, '0', cout12,  cout13, result(13), tmpSet, overflow);
	alu14: ALU31_CMP PORT MAP(data1(14), data2(14), aluop, '0', cout13,  cout14, result(14), tmpSet, overflow);
	alu15: ALU31_CMP PORT MAP(data1(15), data2(15), aluop, '0', cout14,  cout15, result(15), tmpSet, overflow);
	alu16: ALU31_CMP PORT MAP(data1(16), data2(16), aluop, '0', cout15,  cout16, result(16), tmpSet, overflow);
	alu17: ALU31_CMP PORT MAP(data1(17), data2(17), aluop, '0', cout16,  cout17, result(17), tmpSet, overflow);
	alu18: ALU31_CMP PORT MAP(data1(18), data2(18), aluop, '0', cout17,  cout18, result(18), tmpSet, overflow);
	alu19: ALU31_CMP PORT MAP(data1(19), data2(19), aluop, '0', cout18,  cout19, result(19), tmpSet, overflow);
	alu20: ALU31_CMP PORT MAP(data1(20), data2(20), aluop, '0', cout19,  cout20, result(20), tmpSet, overflow);
	alu21: ALU31_CMP PORT MAP(data1(21), data2(21), aluop, '0', cout20,  cout21, result(21), tmpSet, overflow);
	alu22: ALU31_CMP PORT MAP(data1(22), data2(22), aluop, '0', cout21,  cout22, result(22), tmpSet, overflow);
	alu23: ALU31_CMP PORT MAP(data1(23), data2(23), aluop, '0', cout22,  cout23, result(23), tmpSet, overflow);
	alu24: ALU31_CMP PORT MAP(data1(24), data2(24), aluop, '0', cout23,  cout24, result(24), tmpSet, overflow);
	alu25: ALU31_CMP PORT MAP(data1(25), data2(25), aluop, '0', cout24,  cout25, result(25), tmpSet, overflow);
	alu26: ALU31_CMP PORT MAP(data1(26), data2(26), aluop, '0', cout25,  cout26, result(26), tmpSet, overflow);
	alu27: ALU31_CMP PORT MAP(data1(27), data2(27), aluop, '0', cout26,  cout27, result(27), tmpSet, overflow);
	alu28: ALU31_CMP PORT MAP(data1(28), data2(28), aluop, '0', cout27,  cout28, result(28), tmpSet, overflow);
	alu29: ALU31_CMP PORT MAP(data1(29), data2(29), aluop, '0', cout28,  cout29, result(29), tmpSet, overflow);
	alu30: ALU31_CMP PORT MAP(data1(30), data2(30), aluop, '0', cout29,  cout30, result(30), tmpSet, overflow);
	alu31: ALU31_CMP PORT MAP(data1(31), data2(31), aluop, '0', cout30,  cout31, result(31), set,    overflow);
	
	--result(31) <= set;
	dataout<= result;
	
	oflag<= overflow;
	
	cflag<= cout31; --XOR overflow; --overflow = cout30 ^ cout31, so cflag(cout31) = cout30 ^ overflow
	
	zflag<= '1' when result = (result'range=> '0') else '0';
end Behavioral;

