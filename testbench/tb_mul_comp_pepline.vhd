----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 16:17:23
-- Design Name: 
-- Module Name: tb_mul_comp_pepline - Behavioral
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

entity tb_mul_comp_pepline is
--  Port ( );
end tb_mul_comp_pepline;

architecture Behavioral of tb_mul_comp_pepline is

----------component --------------
component mul_comp_pipeline is
    generic(size : integer);
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
end component mul_comp_pipeline;

------signal--------
constant  N   : integer := 4 ;
signal s_clk : std_logic ;
signal s_re1 : unsigned ((N-1) downto 0);
signal s_re2 : unsigned ((N-1) downto 0);
signal s_im1 : unsigned ((N-1) downto 0);
signal s_im2 : unsigned ((N-1) downto 0);
signal s_outputre :unsigned ((2*N-1) downto 0);
signal s_outputim :unsigned ((2*N-1) downto 0);
constant clock_period: time := 10 ns;

begin
C_M_P : mul_comp_pipeline
generic map ( size => N)
port map(
    clock => s_clk,
    re1 => s_re1,
    re2 => s_re2,
    im1 => s_im1,
    im2 => s_im2,
    outputre => s_outputre,
    outputim => s_outputim
);
   clk_process :process
   begin
		s_clk <= '0';
		wait for clock_period/2;
		s_clk <= '1';
		wait for clock_period/2;
   end process;
s_im1 <= "0010";
s_im2 <= "0001";
s_re1 <= "0100";
s_re2 <= "1000";

end Behavioral;