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
			  --less : in STD_LOGIC;
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
		 set, overflow:
		 STD_LOGIC;
signal less: STD_LOGIC;
signal result: STD_LOGIC_VECTOR (31 downto 0);
begin
	alu0:  ALU0_CMP PORT MAP(data1(0),  data2(0),  aluop, less, cin,    cout0,  result(0));
	alu1:  ALU0_CMP PORT MAP(data1(1),  data2(1),  aluop, less, cout0,  cout1,  result(1));
	alu2:  ALU0_CMP PORT MAP(data1(2),  data2(2),  aluop, less, cout1,  cout2,  result(2));
	alu3:  ALU0_CMP PORT MAP(data1(3),  data2(3),  aluop, less, cout2,  cout3,  result(3));
	alu4:  ALU0_CMP PORT MAP(data1(4),  data2(4),  aluop, less, cout3,  cout4,  result(4));
	alu5:  ALU0_CMP PORT MAP(data1(5),  data2(5),  aluop, less, cout4,  cout5,  result(5));
	alu6:  ALU0_CMP PORT MAP(data1(6),  data2(6),  aluop, less, cout5,  cout6,  result(6));
	alu7:  ALU0_CMP PORT MAP(data1(7),  data2(7),  aluop, less, cout6,  cout7,  result(7));
	alu8:  ALU0_CMP PORT MAP(data1(8),  data2(8),  aluop, less, cout7,  cout8,  result(8));
	alu9:  ALU0_CMP PORT MAP(data1(7),  data2(7),  aluop, less, cout8,  cout9,  result(9));
	alu10: ALU0_CMP PORT MAP(data1(10), data2(10), aluop, less, cout9,  cout10, result(10));
	alu11: ALU0_CMP PORT MAP(data1(11), data2(11), aluop, less, cout10, cout11, result(11));
	alu12: ALU0_CMP PORT MAP(data1(12), data2(12), aluop, less, cout11, cout12, result(12));
	alu13: ALU0_CMP PORT MAP(data1(13), data2(13), aluop, less, cout12, cout13, result(13));
	alu14: ALU0_CMP PORT MAP(data1(14), data2(14), aluop, less, cout13, cout14, result(14));
	alu15: ALU0_CMP PORT MAP(data1(15), data2(15), aluop, less, cout14, cout15, result(15));
	alu16: ALU0_CMP PORT MAP(data1(16), data2(16), aluop, less, cout15, cout16, result(16));
	alu17: ALU0_CMP PORT MAP(data1(17), data2(17), aluop, less, cout16, cout17, result(17));
	alu18: ALU0_CMP PORT MAP(data1(18), data2(18), aluop, less, cout17, cout18, result(18));
	alu19: ALU0_CMP PORT MAP(data1(19), data2(19), aluop, less, cout18, cout19, result(19));
	alu20: ALU0_CMP PORT MAP(data1(20), data2(20), aluop, less, cout19, cout20, result(20));
	alu21: ALU0_CMP PORT MAP(data1(21), data2(21), aluop, less, cout20, cout21, result(21));
	alu22: ALU0_CMP PORT MAP(data1(22), data2(22), aluop, less, cout21, cout22, result(22));
	alu23: ALU0_CMP PORT MAP(data1(23), data2(23), aluop, less, cout22, cout23, result(23));
	alu24: ALU0_CMP PORT MAP(data1(24), data2(24), aluop, less, cout23, cout24, result(24));
	alu25: ALU0_CMP PORT MAP(data1(25), data2(25), aluop, less, cout24, cout25, result(25));
	alu26: ALU0_CMP PORT MAP(data1(26), data2(26), aluop, less, cout25, cout26, result(26));
	alu27: ALU0_CMP PORT MAP(data1(27), data2(27), aluop, less, cout26, cout27, result(27));
	alu28: ALU0_CMP PORT MAP(data1(28), data2(28), aluop, less, cout27, cout28, result(28));
	alu29: ALU0_CMP PORT MAP(data1(29), data2(29), aluop, less, cout28, cout29, result(29));
	alu30: ALU0_CMP PORT MAP(data1(30), data2(30), aluop, less, cout29, cout30, result(30));
	alu31: ALU31_CMP PORT MAP(data1(31), data2(31), aluop, less, cout30, result(31), set, overflow);
	
	dataout<= result;
	
	oflag<= overflow;
	
	cflag<= cout30 XOR overflow; --overflow = cout30 ^ cout31, so cflag(cout31) = cout30 ^ overflow
	
	zflag<= '1' when result = (result'range=> '0') else '0';
end Behavioral;

