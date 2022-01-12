--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:08:21 01/11/2022
-- Design Name:   
-- Module Name:   C:/.Xilinx/ASM_Ascensor/AscensorTB.vhd
-- Project Name:  ASM_Ascensor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ascensor
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
 
ENTITY AscensorTB IS
END AscensorTB;
 
ARCHITECTURE behavior OF AscensorTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ascensor
    PORT(
         Tiempo : IN  std_logic;
         SPY : IN  std_logic;
         PisoReqX : IN  std_logic;
         PisoReqY : IN  std_logic;
         clk : IN  std_logic;
         PuertaAbierta : OUT  std_logic;
         PuertaCerrada : OUT  std_logic;
         PARO : OUT  std_logic;
         AvancePiso : OUT  std_logic;
         Q1 : INOUT  std_logic;
         Q0 : INOUT  std_logic;
			Q2 : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Tiempo : std_logic := '0';
   signal SPY : std_logic := '0';
   signal PisoReqX : std_logic := '0';
   signal PisoReqY : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal Q1 : std_logic;
   signal Q0 : std_logic;
	signal Q2 : std_logic;

 	--Outputs
   signal PuertaAbierta : std_logic;
   signal PuertaCerrada : std_logic;
   signal PARO : std_logic;
   signal AvancePiso : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ascensor PORT MAP (
          Tiempo => Tiempo,
          SPY => SPY,
          PisoReqX => PisoReqX,
          PisoReqY => PisoReqY,
          clk => clk,
          PuertaAbierta => PuertaAbierta,
          PuertaCerrada => PuertaCerrada,
          PARO => PARO,
          AvancePiso => AvancePiso,
          Q1 => Q1,
          Q0 => Q0,
			 Q2 => Q2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
