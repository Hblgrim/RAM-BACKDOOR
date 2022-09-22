----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2022 15:59:00
-- Design Name: 
-- Module Name: tb_modulation - Behavioral
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

entity tb_modulation is
--  Port ( );
end tb_modulation;

architecture Behavioral of tb_modulation is
component  modulation is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ook : in STD_LOGIC;
           in_data : in STD_LOGIC;
           out_data : out STD_LOGIC);
end component modulation;

signal clk : std_logic ;
signal rst : std_logic ;
signal ook : std_logic ;
signal in_data : std_logic ;
signal out_data : std_logic ;
constant periode : time := 10 ns;

begin

modu : modulation port map (
        clk => clk,
        rst => rst ,
        ook => ook ,
        in_data => in_data,
        out_data => out_data);

process
begin
clk <= '1' ;
wait for periode/2;
clk <= '0' ;
wait for periode/2;
end process;

rst <= '1', '0' after 30 ns; 
ook <= '1' ;      
in_data <= '1', '0' after 1 us , '1' ;
end Behavioral;
