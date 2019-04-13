-----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY DEC_TEST IS
END DEC_TEST;
 
ARCHITECTURE behavior OF DEC_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DEC
    PORT(
         I : IN  std_logic_vector(1 downto 0);
         E : IN  std_logic;
         O : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic_vector(1 downto 0) := (others => '0');
   signal E : std_logic := '0';

 	--Outputs
   signal O : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DEC PORT MAP (
          I => I,
          E => E,
          O => O
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      I <= "11";
		wait for 100 ns;	
		E <= '1';
		wait for 50 ns;
		E <= '0';
		wait for 50 ns;
		I <= "00";
		E <= '1';
		wait for 50 ns;
		E <= '0';
		

      -- insert stimulus here 

      wait;
   end process;

END;
