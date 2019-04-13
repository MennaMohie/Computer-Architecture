--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:12:28 04/12/2019
-- Design Name:   
-- Module Name:   X:/College/Y3/T2/Computer Architecture/Tasks/M1/blah/ALU0_TEST.vhd
-- Project Name:  blah
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU0
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU0_TEST IS
END ALU0_TEST;
 
ARCHITECTURE behavior OF ALU0_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU0
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         aluop : IN  std_logic_vector(3 downto 0);
         less : IN  std_logic;
         cin : IN  std_logic;
         cout : OUT  std_logic;
         result : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal aluop : std_logic_vector(3 downto 0) := (others => '0');
   signal less : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal cout : std_logic;
   signal result : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU0 PORT MAP (
          a => a,
          b => b,
          aluop => aluop,
          less => less,
          cin => cin,
          cout => cout,
          result => result
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 500 ns;
		aluop <= "0000";
		wait for 500 ns;
		a <= '1';
		wait for 500 ns;
		b <= '1';
		wait for 500 ns;
		aluop <= "1100";
		wait for 500 ns;
		aluop <= "1000";
		wait for 500 ns;
		aluop <= "0010";
		wait for 500 ns;
		aluop <= "0011";
		wait for 500 ns;
		aluop <= "0111";
		wait for 500 ns;
		aluop <= "1010";
		wait for 500 ns;
		aluop <= "1000";
		wait for 500 ns;
		aluop <= "0000";
		wait for 500 ns;
		aluop <= "1111";
		wait for 500 ns;
		aluop <= "0000";
		wait for 500 ns;
		aluop <= "1010";
		wait for 500 ns;
		aluop <= "0000";
		wait for 500 ns;

      wait;
   end process;

END;
