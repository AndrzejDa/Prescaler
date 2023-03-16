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

entity Prescaler_tb is
--  Port ( );
end Prescaler_tb;

architecture Behavioral of Prescaler_tb is
    component Prescaler
        Port (clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC;
        led_o : out STD_LOGIC);
    end component;

    --inputs
    signal clk_i : std_logic;
    signal rst_i : std_logic;
    
    --outputs
    signal led_o : std_logic;
    
    --constants
    constant CLOCK_period : time := 20 ns;
    constant delay : time := 10 ns;
    
begin
    uut: Prescaler PORT MAP(
        clk_i => clk_i,
        rst_i => rst_i,
        led_o => led_o
     );
     
     --clock process definition
    CLOCK_process : process
    begin
        clk_i <= '1';
        wait for CLOCK_period/2;
        clk_i <= '0';
        wait for CLOCK_period/2;
    end process;
    
    -- stimulus process
    stim_proc: process
    begin
        --wait for 10 ns; 
        rst_i <= '1';
        wait for 10 ns;
        rst_i <= '0';
        wait for 700 ns;
        rst_i <= '1';
        wait for 10 ns;
        rst_i <= '0';     
        wait;
    end process;


end Behavioral;
