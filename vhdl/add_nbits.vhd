----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2022 14:20:19
-- Design Name: 
-- Module Name: add_nbits - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_nbits is
generic(size : integer:= 8);
    Port ( 
           --clock
            clock : in STD_LOGIC;
           --inputs--
           number1 : in unsigned (size downto 0);
           number2 : in unsigned (size downto 0);
           --outputs
           output : out unsigned (size+1 downto 0)
           );
end add_nbits;
architecture Behavioral of add_nbits is
signal s1 : unsigned (size downto 0);
signal s2 : unsigned (size downto 0);
--signal res : unsigned (size+1 downto 0);

begin
process(clock)
begin
    if rising_edge (clock) then

    s1 <= number1;
    s2 <= number2;
    --res <= ('0'& s1) +('0'& s2) ;
    output <= ('0'& s1) +('0'& s2)  ;
 end if;
 end process;

end Behavioral;

