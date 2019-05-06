----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:05 04/28/2019 
-- Design Name: 
-- Module Name:    ADDER - Behavioral 
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
use work.COMPONENTS.ALL;

-- Uncomment the following library declaration if usingw
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADDER is
    Port ( a : in  STD_LOGIC_VECTOR(31 downto 0);
           b : in  STD_LOGIC_VECTOR(31 downto 0);
			  cin : in STD_LOGIC;
           cout : out  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR(31 downto 0));
end ADDER;

architecture Behavioral of ADDER is
signal cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7, cout8, cout9, cout10,
		 cout11, cout12, cout13, cout14, cout15, cout16, cout17, cout18, cout19, cout20,
		 cout21, cout22, cout23, cout24, cout25, cout26, cout27, cout28, cout29, cout30, cout31:
		 STD_LOGIC;
signal temp_result: STD_LOGIC_VECTOR(31 downto 0);
begin
	adder0:  OneBitAdder PORT MAP(a(0),  b(0),  cin,    cout0,  temp_result(0));
	adder1:  OneBitAdder PORT MAP(a(1),  b(1),  cout0,  cout1,  temp_result(1));
	adder2:  OneBitAdder PORT MAP(a(2),  b(2),  cout1,  cout2,  temp_result(2));
	adder3:  OneBitAdder PORT MAP(a(3),  b(3),  cout2,  cout3,  temp_result(3));
	adder4:  OneBitAdder PORT MAP(a(4),  b(4),  cout3,  cout4,  temp_result(4));
	adder5:  OneBitAdder PORT MAP(a(5),  b(5),  cout4,  cout5,  temp_result(5));
	adder6:  OneBitAdder PORT MAP(a(6),  b(6),  cout5,  cout6,  temp_result(6));
	adder7:  OneBitAdder PORT MAP(a(7),  b(7),  cout6,  cout7,  temp_result(7));
	adder8:  OneBitAdder PORT MAP(a(8),  b(8),  cout7,  cout8,  temp_result(8));
	adder9:  OneBitAdder PORT MAP(a(9),  b(9),  cout8,  cout9,  temp_result(9));
	adder10: OneBitAdder PORT MAP(a(10), b(10), cout9,  cout10, temp_result(10));
	adder11: OneBitAdder PORT MAP(a(11), b(11), cout10, cout11, temp_result(11));
	adder12: OneBitAdder PORT MAP(a(12), b(12), cout11, cout12, temp_result(12));
	adder13: OneBitAdder PORT MAP(a(13), b(13), cout12, cout13, temp_result(13));
	adder14: OneBitAdder PORT MAP(a(14), b(14), cout13, cout14, temp_result(14));
	adder15: OneBitAdder PORT MAP(a(15), b(15), cout14, cout15, temp_result(15));
	adder16: OneBitAdder PORT MAP(a(16), b(16), cout15, cout16, temp_result(16));
	adder17: OneBitAdder PORT MAP(a(17), b(17), cout16, cout17, temp_result(17));
	adder18: OneBitAdder PORT MAP(a(18), b(18), cout17, cout18, temp_result(18));
	adder19: OneBitAdder PORT MAP(a(19), b(19), cout18, cout19, temp_result(19));
	adder20: OneBitAdder PORT MAP(a(20), b(20), cout19, cout20, temp_result(20));
	adder21: OneBitAdder PORT MAP(a(21), b(21), cout20, cout21, temp_result(21));
	adder22: OneBitAdder PORT MAP(a(22), b(22), cout21, cout22, temp_result(22));
	adder23: OneBitAdder PORT MAP(a(23), b(23), cout22, cout23, temp_result(23));
	adder24: OneBitAdder PORT MAP(a(24), b(24), cout23, cout24, temp_result(24));
	adder25: OneBitAdder PORT MAP(a(25), b(25), cout24, cout25, temp_result(25));
	adder26: OneBitAdder PORT MAP(a(26), b(26), cout25, cout26, temp_result(26));
	adder27: OneBitAdder PORT MAP(a(27), b(27), cout26, cout27, temp_result(27));
	adder28: OneBitAdder PORT MAP(a(28), b(28), cout27, cout28, temp_result(28));
	adder29: OneBitAdder PORT MAP(a(29), b(29), cout28, cout29, temp_result(29));
	adder30: OneBitAdder PORT MAP(a(30), b(30), cout29, cout30, temp_result(30));
	adder31: OneBitAdder PORT MAP(a(31), b(31), cout30, cout31, temp_result(31));
	
	result<= temp_result;
	cout<= cout31;
end Behavioral;

