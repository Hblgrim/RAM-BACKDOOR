----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2022 17:31:39
-- Design Name: 
-- Module Name: timer2us - Behavioral
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

entity timer2us is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           
           timeout : out STD_LOGIC);
end timer2us;

architecture Behavioral of timer2us is
signal count : integer range 0 to 200;
begin
process(clk,rst)
begin
if rst = '1' then
    timeout <= '0';
    count <= 0;
elsif rising_edge (clk) then
     if enable ='1' then
        if count < 199 then 
        count <= count +1;
        else
        count <= 0;
        timeout <= '1';
        end if;
end if;    
end if;
end process;

end Behavioral;