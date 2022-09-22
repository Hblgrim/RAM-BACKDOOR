----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2022 16:57:50
-- Design Name: 
-- Module Name: timer100n - Behavioral
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

entity timer100n is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           timeout : out STD_LOGIC);
end timer100n;

architecture Behavioral of timer100n is

signal count : integer range 0 to 3;
begin
process(clk,rst)
begin
if rst = '1' then
    timeout <= '0';
    count <= 0;
elsif rising_edge (clk) then
     if enable ='1' then
        if count >= 2 then 
        count <= 0;
        timeout <= '1';
        else
        count <= count + 1;
        timeout <= '0';
        end if;
end if;    
end if;
end process;


end Behavioral;