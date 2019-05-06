----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:24:25 04/28/2019 
-- Design Name: 
-- Module Name:    OR_GENERIC - Behavioral 
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

entity OR_GENERIC is
GENERIC(numOfBits:natural:= 6);
    Port ( I : in  STD_LOGIC_VECTOR(numOfBits - 1 downto 0);
           O : out  STD_LOGIC);
end OR_GENERIC;

architecture Behavioral of OR_GENERIC is
begin
	O<= '0' when I = (I'range=> '0') else '1';
end Behavioral;

