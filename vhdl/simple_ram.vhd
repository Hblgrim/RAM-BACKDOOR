----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 17:03:28
-- Design Name: 
-- Module Name: simple_ram - Behavioral
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

entity simple_ram is
        --generic(size : integer);
        port (
        clk : in std_logic;
        we : in std_logic;
        en : in std_logic;
        addr : in std_logic_vector(5 downto 0);
        datain : in std_logic_vector(15 downto 0);
        dataout : out std_logic_vector(15 downto 0)
    );
end simple_ram;

architecture Behavioral of simple_ram is

--------types--------------
type ram_type is array (63 downto 0) of std_logic_vector (15 downto 0);
--------signal-------------------
signal RAM : ram_type;

begin

process (clk)
begin
    if rising_edge(clk) then   
        if en = '1' then
            if we = '1' then
                RAM(conv_integer(addr)) <= datain;
            end if;                
        end if;
    end if;
end process;
dataout <= RAM(conv_integer(addr));

end Behavioral;


