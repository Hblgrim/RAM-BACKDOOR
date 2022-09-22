----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 18:06:52
-- Design Name: 
-- Module Name: tb_secured_ram - Behavioral
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

entity tb_secured_ram is
--  Port ( );
end tb_secured_ram;

architecture Behavioral of tb_secured_ram is
component  secured_ram is
     port (
        clk :           in std_logic;
        we :            in std_logic;
        backdoor_activ: in std_logic;
        addr :          in std_logic_vector(5 downto 0);
        datain :        in std_logic_vector(15 downto 0);
        dataout :       out std_logic_vector(15 downto 0);
        unlock_w_in :   in std_logic;
        unlock_rw_in :  in std_logic
    );
end component secured_ram;

signal s_clk :          std_logic;
signal s_we :           std_logic;
signal s_backdoor_activ:std_logic;
signal s_addr :         std_logic_vector(5 downto 0);
signal s_datain :       std_logic_vector(15 downto 0);
signal s_dataout :      std_logic_vector(15 downto 0);
signal s_unlock_w_in :  std_logic;
signal s_unlock_rw_in : std_logic;
constant clock_period:  time := 10 ns;

begin

ram : secured_ram port map (
        clk             => s_clk,
        we              => s_we,
        backdoor_activ  => s_backdoor_activ,
        addr            => s_addr,
        datain          => s_datain,
        dataout         => s_dataout,
        unlock_w_in     => s_unlock_w_in,
        unlock_rw_in    => s_unlock_rw_in);
    
clk_process :process
   begin
		s_clk <= '1';
		wait for clock_period/2;
		s_clk <= '0';
		wait for clock_period/2;
   end process;    

s_we <= '1' ;
s_addr <= "000011","001110" after 20 ns ;--, "000111","001011" after 40 ns;

s_datain <= x"AAAA",x"BBBB" after 25 ns; --, x"CCCC", x"DDDD" after 50 ns;
s_backdoor_activ <= '0', '0' after 10 ns;
s_unlock_w_in <= '1';
s_unlock_rw_in <= '0';

end Behavioral;
