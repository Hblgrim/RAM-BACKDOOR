----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 17:46:52
-- Design Name: 
-- Module Name: secured_ram - Behavioral
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
use IEEE.STD_LOGIC_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity secured_ram is
     port (
        clk : in std_logic;
        backdoor_activ : in std_logic;
        we : in std_logic;
        addr : in std_logic_vector(5 downto 0);
        datain : in std_logic_vector(15 downto 0);
        dataout : out std_logic_vector(15 downto 0);
        unlock_w_in : in std_logic;
        unlock_rw_in : in std_logic
    );
end secured_ram;

architecture Behavioral of secured_ram is

----------component --------------

component simple_ram is
        --generic(size : integer);
        port (
        clk :     in std_logic;
        we :      in std_logic;
        en :      in std_logic ;
        addr :    in std_logic_vector(5 downto 0);
        datain :  in std_logic_vector(15 downto 0);
        dataout : out std_logic_vector(15 downto 0)
    );
end component simple_ram;


constant addr_ram :     integer := 16;
constant addr_w_lock :  integer := 0;
constant addr_rw_lock : integer := 8;

------signal--------
signal enable : std_logic := '0';

begin

    C_S_R : simple_ram
    port map(
        clk       => clk,
        we        => we,
        en        => enable,
        addr      => addr,
        datain    => datain,
        dataout   => dataout
    );
    --sans limit
    enable <= '1' when (to_integer(unsigned(addr)) >= addr_ram )
    
    -- R
    -- entre 0 et 8
    else '1' when (to_integer(unsigned(addr)) >= addr_w_lock and to_integer(unsigned(addr)) < addr_rw_lock and unlock_w_in = '1' and we = '1' )
    else '1' when (to_integer(unsigned(addr)) >= addr_w_lock and to_integer(unsigned(addr)) < addr_rw_lock and we = '0' )
    
    -- R/W
    -- entre 8 et 16 
    else '1' when (to_integer(unsigned(addr)) >= addr_rw_lock and to_integer(unsigned(addr)) < addr_ram and ( unlock_rw_in = '1' or backdoor_activ ='1') )
    else '0'; 

end Behavioral;


