----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2022 14:34:32
-- Design Name: 
-- Module Name: tb_timer - Behavioral
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

entity tb_timer is
--  Port ( );
end tb_timer;

architecture Behavioral of tb_timer is
component timer_1u is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           timeout : out STD_LOGIC);
end component timer_1u;

signal clk : std_logic; 
signal rst : std_logic ;
signal enable : std_logic; 
signal timeout : std_logic ;
constant periode : time := 10 ns;

begin
 timer : timer_1u port map (
 
    clk => clk,
    rst => rst,
    timeout => timeout,
    enable => enable);
    

process
begin
clk <= '1' ;
wait for periode/2;
clk <= '0' ;
wait for periode/2;
end process;

rst <= '1', '0' after 30 ns;    
enable <= '0', '1' after 40 ns, '0';

end Behavioral;
