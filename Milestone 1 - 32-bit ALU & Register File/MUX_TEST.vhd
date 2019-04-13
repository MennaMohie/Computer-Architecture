--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY MUX_TEST IS
END MUX_TEST;
 
ARCHITECTURE behavior OF MUX_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         I : IN  std_logic_vector(31 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         O : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic_vector(31 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          I => I,
          S => S,
          O => O
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 0 ns;	
		I(7 downto 0) <= std_logic_vector(to_unsigned(7, 8));
		wait for 100 ns;
		I(15 downto 8) <= std_logic_vector(to_unsigned(3, 8));
		wait for 100 ns;
		I(23 downto 16) <= std_logic_vector(to_unsigned(11, 8));
		wait for 100 ns;
		I(31 downto 24) <= std_logic_vector(to_unsigned(15, 8));
		wait for 100 ns;
		S <= "01";
      wait for 500 ns;	
		S <= "11";
      wait for 500 ns;	
		S <= "10";
      wait for 500 ns;	
		S <= "00";

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
