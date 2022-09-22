----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2022 15:40:53
-- Design Name: 
-- Module Name: adder_pipeline_nbits - Behavioral
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

entity adder_pipeline_nbits is
    generic(size : integer:=8);
    Port ( 
            clock : in std_logic ;
           --inputs--
           number1 : in unsigned (size downto 0);
           number2 : in unsigned (size downto 0);
           --outputs
           output : out unsigned (size+1 downto 0)
    );

end adder_pipeline_nbits;

architecture Behavioral of adder_pipeline_nbits is
-----------singnaux --------------
signal s_a_nb1 : unsigned ((size/2)-1 downto 0);
signal s_a_nb2 : unsigned (size downto (size/2));
signal s_b_nb1 : unsigned ((size/2)-1 downto 0);
signal s_b_nb2 : unsigned (size downto (size/2));
signal s_output1 : unsigned ((size/2) downto 0);
signal s_output2 : unsigned (size+1 downto (size/2));
signal s_carry : unsigned (1 downto 0);
signal ssouput : unsigned (size+1 downto (size/2));

begin
process(clock)
begin
if rising_edge (clock) then 
-- les instruction sur un front d'horloge 
-- c'est plus avantageux par rapport à clock event 
-- car en implémentation ça donne la meme chose en simulation 
s_a_nb1 <= ( number1( (size/2)-1 downto 0) );
s_b_nb1 <= ( number2( (size/2)-1 downto 0) );
s_output1 <= ('0' & s_a_nb1) + ('0' & s_b_nb1);


s_a_nb2 <= ( number1(size downto size/2));
s_b_nb2 <= ( number2(size downto size/2));
s_output2 <= ('0' &s_a_nb2) +('0' & s_b_nb2);
----- on ajout un signal interne car on peut pas mettre une nouvelle variable dans le signal soutput2 vu que 
------- dans VHDL les instruction s'execute au meme temps et
s_carry <= ( '0' & s_output1(size/2));
ssouput <= s_output2 + s_carry ;
output <=  ssouput & s_output1(size/2-1 downto 0);
end if;
end process;

end Behavioral;