----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:08:10 04/13/2019 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
signal decoder_out,
		 reg0_out, reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out, reg8_out, reg9_out,
		 reg10_out, reg11_out, reg12_out, reg13_out, reg14_out, reg15_out, reg16_out, reg17_out, reg18_out,
		 reg19_out, reg20_out, reg21_out, reg22_out, reg23_out, reg24_out, reg25_out, reg26_out, reg27_out,
		 reg28_out, reg29_out, reg30_out, reg31_out:
		 STD_LOGIC_VECTOR(31 downto 0);
begin
	dec_write: DEC GENERIC MAP(numOfSelectors=> 5) PORT MAP(write_sel, write_ena, decoder_out);
	
	reg0:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(0),  '0', '0', reg0_out);
	reg1:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(1),  '0', '0', reg1_out);
	reg2:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(2),  '0', '0', reg2_out);
	reg3:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(3),  '0', '0', reg3_out);
	reg4:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(4),  '0', '0', reg4_out);
	reg5:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(5),  '0', '0', reg5_out);
	reg6:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(6),  '0', '0', reg6_out);
	reg7:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(7),  '0', '0', reg7_out);
	reg8:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(8),  '0', '0', reg8_out);
	reg9:  REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(9),  '0', '0', reg9_out);
	reg10: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(10), '0', '0', reg10_out);
	reg11: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(11), '0', '0', reg11_out);
	reg12: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(12), '0', '0', reg12_out);
	reg13: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(13), '0', '0', reg13_out);
	reg14: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(14), '0', '0', reg14_out);
	reg15: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(15), '0', '0', reg15_out);
	reg16: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(16), '0', '0', reg16_out);
	reg17: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(17), '0', '0', reg17_out);
	reg18: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(18), '0', '0', reg18_out);
	reg19: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(19), '0', '0', reg19_out);
	reg20: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(20), '0', '0', reg20_out);
	reg21: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(21), '0', '0', reg21_out);
	reg22: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(22), '0', '0', reg22_out);
	reg23: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(23), '0', '0', reg23_out);
	reg24: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(24), '0', '0', reg24_out);
	reg25: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(25), '0', '0', reg25_out);
	reg26: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(26), '0', '0', reg26_out);
	reg27: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(27), '0', '0', reg27_out);
	reg28: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(28), '0', '0', reg28_out);
	reg29: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(29), '0', '0', reg29_out);
	reg30: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(30), '0', '0', reg30_out);
	reg31: REG GENERIC MAP(n=> 32) PORT MAP(write_data, clk,  decoder_out(31), '0', '0', reg31_out);

	mux_read1: MUX GENERIC MAP(numOfSelectors=> 5, numOfBits=> 32)
						  PORT MAP(
						  reg31_out & reg30_out & reg29_out & reg28_out & reg27_out & reg26_out & reg25_out &
						  reg24_out & reg23_out & reg22_out & reg21_out & reg20_out & reg19_out & reg18_out &
						  reg17_out & reg16_out & reg15_out & reg14_out & reg13_out & reg12_out & reg11_out & 
						  reg10_out & reg9_out  & reg8_out  & reg7_out  & reg6_out   & reg5_out  & reg4_out  &
						  reg3_out  & reg2_out  & reg1_out  & reg0_out, read_sel1, data1);
	mux_read2: MUX GENERIC MAP(numOfSelectors=> 5, numOfBits=> 32)
						  PORT MAP(
						  reg31_out & reg30_out & reg29_out & reg28_out & reg27_out & reg26_out & reg25_out &
						  reg24_out & reg23_out & reg22_out & reg21_out & reg20_out & reg19_out & reg18_out &
						  reg17_out & reg16_out & reg15_out & reg14_out & reg13_out & reg12_out & reg11_out & 
						  reg10_out & reg9_out  & reg8_out  & reg7_out  & reg6_out   & reg5_out  & reg4_out  &
						  reg3_out  & reg2_out  & reg1_out  & reg0_out, read_sel2, data2);
end Behavioral;

