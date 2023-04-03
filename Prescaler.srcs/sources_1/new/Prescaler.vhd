----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2023 21:46:18
-- Design Name: 
-- Module Name: Prescaler - Behavioral
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

entity Prescaler is
    Port ( clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            led_o : out STD_LOGIC);
end Prescaler;

architecture Behavioral of Prescaler is

signal N: integer := 42;    --constant 
signal counter : integer := 0;
signal temp : STD_LOGIC := '0' ;   --to change value of led        

begin
process(clk_i, rst_i)
    begin
    if(rst_i = '1') then
        counter <= 0;
        temp <= '0';
    elsif rising_edge(clk_i) then    
        if(counter = N/2) then
            temp <= not temp;
            counter <= 0;
        else
            counter <= counter + 1;        
        end if;
    end if;
    
end process;

led_o <= temp;

end Behavioral;