----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2022 13:51:04
-- Design Name: 
-- Module Name: tb_top_conv - Behavioral
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

entity tb_top_conv is
--  Port ( );
end tb_top_conv;

architecture Behavioral of tb_top_conv is
component  top_conv is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC;
           activation : in STD_LOGIC);
end component top_conv;

signal s_clk : std_logic ;
signal s_rst : std_logic ;
signal s_data_in : std_logic_vector (7 downto 0) ;
signal s_data_out : std_logic ;
signal s_activation : std_logic ;
constant periode : time := 10 ns;
begin

topconv : top_conv port map (
            clk     => s_clk,
            rst     => s_rst,
            data_in => s_data_in,
            data_out=> s_data_out,
            activation=> s_activation);

process
begin
s_clk <= '1' ;
wait for periode/2;
s_clk <= '0' ;
wait for periode/2;
end process;

s_rst <= '1', '0' after 30 ns;
s_data_in <= "10011011";
s_activation <= '1', '0' after 1 us ;
 
end Behavioral;
