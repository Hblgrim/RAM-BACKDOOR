----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2022 11:56:09
-- Design Name: 
-- Module Name: tb_top_level - Behavioral
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

entity tb_top_level is
--  Port ( );
end tb_top_level;

architecture Behavioral of tb_top_level is
component  top_level is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           rst : in STD_LOGIC;
           adrs : in STD_LOGIC_VECTOR (5 downto 0);
           unlock_w_in : in STD_LOGIC;
           unlock_rw_in : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC;
           code : in STD_LOGIC_VECTOR (2 downto 0));
end component top_level;

signal clk : std_logic;
signal rst : std_logic;
signal we : std_logic;
signal adrs : STD_LOGIC_VECTOR (5 downto 0);
signal unlock_w_in : std_logic;
signal unlock_rw_in : std_logic;
signal data_in : STD_LOGIC_VECTOR (15 downto 0);
signal data_out : std_logic;
signal code : STD_LOGIC_VECTOR (2 downto 0);
constant periode : time := 10 ns;

begin

top_bloc : top_level port map (
            clk         => clk,
            rst         => rst,
            we          => we,
            adrs        => adrs,
            unlock_w_in => unlock_w_in,
            unlock_rw_in=> unlock_rw_in,
            data_in     => data_in,
            data_out    => data_out,
            code        => code);

process
begin
    clk <= '1' ;
    wait for periode/2;
    clk <= '0' ;
    wait for periode/2;
end process;

rst     <= '1', '0' after 20 ns;
we      <= '0' , '1' after 25 ns;
adrs  <= "000010", "100000" after 5050 ns;
-- pour tester tous les cas ( zones de la ram) 
unlock_w_in     <= '0' , '1' after 5035 ns;
unlock_rw_in    <=  '0' , '1' after 5060 ns;
data_in         <= x"1023", x"AB42" after 5040 ns;

 process
 begin
 code <="110";
 wait for 3us;
  code <="100";
 wait for 3us;
  code <="010";
 wait for 3us;
 end process;
  
end Behavioral;
