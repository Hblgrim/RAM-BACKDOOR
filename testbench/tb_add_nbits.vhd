----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2022 14:20:49
-- Design Name: 
-- Module Name: tb_add_nbits - Behavioral
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

entity tb_add_nbits is
--  Port ( );
end tb_add_nbits;

architecture Behavioral of tb_add_nbits is

component add_nbits is

generic(size : integer);
    Port ( 
           --clock
            clock : in STD_LOGIC;
           --inputs
           number1 : in unsigned (size downto 0);
           number2 : in unsigned (size downto 0);
           --outputs--
           output : out unsigned (size+1 downto 0)
           );
end component add_nbits;

------signal--------
constant  N   : integer := 2 ;
signal s_numb1 : unsigned (N downto 0);
signal s_numb2 : unsigned (N downto 0);
signal s_output : unsigned (N+1 downto 0);
signal s_clk : std_logic ;
constant clock_period: time := 10 ns;

begin
---------- port map--------
U1 : add_nbits 
generic map ( size => N)
port map(
    clock => s_clk,
    number1 => s_numb1,
    number2 => s_numb2,
    output => s_output
);

clk_process :process
   begin
		s_clk <= '0';
		wait for clock_period/2;
		s_clk <= '1';
		wait for clock_period/2;
end process;

s_numb1 <= "010";
s_numb2 <= "001";

end Behavioral;
