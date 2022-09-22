----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2022 17:50:42
-- Design Name: 
-- Module Name: mul_comp_pipeline - Behavioral
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

entity mul_comp_pipeline is
    generic(size : integer:= 64);
    Port ( 
            --clock
            clock : in STD_LOGIC;
           --inputs
           re1 : in unsigned ((size-1) downto 0);
           re2 : in unsigned ((size-1) downto 0);
           im1 : in unsigned ((size-1) downto 0);
           im2 : in unsigned ((size-1) downto 0);
           --outputs--
           outputre : out unsigned ((2*size-1) downto 0);
           outputim : out unsigned ((2*size-1) downto 0)
           
           );
end mul_comp_pipeline;

architecture Behavioral of mul_comp_pipeline is

signal s_re1 : unsigned ((size-1) downto 0);
signal s_re2 : unsigned ((size-1) downto 0);
signal s_im1 : unsigned ((size-1) downto 0);
signal s_im2 : unsigned ((size-1) downto 0);

signal p1 : unsigned ((2*size-1) downto 0);
signal p2 : unsigned ((2*size-1) downto 0);
signal p3 : unsigned ((2*size-1) downto 0);
signal p4 : unsigned ((2*size-1) downto 0);


begin

process(clock)
begin
    if rising_edge (clock) then
    s_re1 <= re1;
    s_re2 <= re2;
    s_im1 <= im1;
    s_im2 <= im2;
    
    p1 <= s_re1*s_im2;
    p4 <= s_re1*s_re2;
    p2 <= s_im1*(s_im2+s_re2);
    p3 <= s_re2*(s_re1+s_im1);
   
    outputre <= p3 - p2; 
    outputim <= p1 + p3 - p4; 
    
    
    
end if;
end process;
    


end Behavioral;
