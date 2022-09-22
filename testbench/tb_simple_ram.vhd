----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 17:12:35
-- Design Name: 
-- Module Name: tb_simple_ram - Behavioral
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

entity tb_simple_ram is
--  Port ( );
end tb_simple_ram;

architecture Behavioral of tb_simple_ram is
----------component --------------
component simple_ram is
        --generic(size : integer);
        port (
        clk : in std_logic;
        we : in std_logic;
        en : in std_logic;
        addr : in std_logic_vector(5 downto 0);
        datain : in std_logic_vector(15 downto 0);
        dataout : out std_logic_vector(15 downto 0)
    );
end component simple_ram;
------signal--------
        signal s_clk : std_logic;
        signal s_we : std_logic;
        signal s_en : std_logic;
        signal s_addr : std_logic_vector(5 downto 0);
        signal s_datain : std_logic_vector(15 downto 0);
        signal s_dataout : std_logic_vector(15 downto 0);
        constant clock_period: time := 10 ns;

begin
    C_R : simple_ram
    port map(
        clk => s_clk,
        we => s_we,
        en => s_en,
        addr => s_addr,
        datain => s_datain,
        dataout => s_dataout
    );
    
   clk_process :process
   begin
        s_clk <= '0';
        wait for clock_period/2;
        s_clk <= '1';
        wait for clock_period/2;
   end process;
   
s_we <= '0', '1' after 10 ns;
s_en <= '0', '1' after 5 ns;

s_addr <= "000001","000011" after 20 ns;
s_datain <= x"0005";

end Behavioral;

