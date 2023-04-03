----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2023 21:48:33
-- Design Name: 
-- Module Name: Prescaler_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Prescaler_tb is
--  Port ( );
end Prescaler_tb;

architecture Behavioral of Prescaler_tb is

component Prescaler
	port(
		clk_i : IN  std_logic;
		rst_i : IN  std_logic;
		led_o : OUT std_logic
	);
	end component;
    
    --inputs
    signal clk_i : std_logic := '0';
    signal rst_i : std_logic := '0';
    --outputs
    signal led_o : std_logic := '0';
    
    --constant values
    constant CLOCK_period : time := 20 ns;
    constant delay : time := 10 ns;
    
begin

--unit under test
uut: Prescaler port map(
        clk_i => clk_i,
        rst_i => rst_i,
        led_o => led_o
     );

CLOCK_process : process
    begin
        clk_i <= '1';
        wait for CLOCK_period/2;
        clk_i <= '0';
        wait for CLOCK_period/2;
    end process;

Reset_process : process
    begin       
        rst_i <= '1';
        wait for delay;
        rst_i <= '0';
        wait for 1500 ns;
        rst_i <= '1';
        wait for delay;
        rst_i <= '0';     
        wait;
    end process;
    
end Behavioral;