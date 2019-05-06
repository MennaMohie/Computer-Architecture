----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:33 04/28/2019 
-- Design Name: 
-- Module Name:    AND_GENERIC - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AND_GENERIC is
GENERIC(numOfBits: natural := 6);
PORT(
	I: IN STD_LOGIC_VECTOR(numOfBits - 1 downto 0);
	O: OUT STD_LOGIC);
end AND_GENERIC;

architecture Behavioral of AND_GENERIC is
begin
	O<= '1' when I = (I'range=> '1') else '0';
end Behavioral;

