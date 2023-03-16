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
  Port (clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC;
        led_o : out STD_LOGIC);
end Prescaler;

architecture Behavioral of Prescaler is
constant N : integer := 31;
signal counter : integer := 0;
signal state : std_logic := '1';

begin
led_o <= state;
process(clk_i, rst_i)

begin
    
    if rising_edge(rst_i) then
        counter <= 1;
    else
        if clk_i'event then
            if counter = N then 
                counter <= 1;
                    if state = '1' then 
                        led_o <= '0';
                        state <= '0';
                    else led_o <= '1';
                        state <= '1';
                    end if;
            else counter <= counter +1;
                led_o <= state;
            end if; 
        end if;
    end if;

end process;

end Behavioral;
