----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2022 18:27:52
-- Design Name: 
-- Module Name: top_backdoor - Behavioral
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

entity top_backdoor is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC);
end top_backdoor;

architecture Behavioral of top_backdoor is
component  backdoor is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           timer : in std_logic;
           start_count : out std_logic;
           data_in : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC);
end component backdoor;

component  timer2us is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           timeout : out STD_LOGIC);
end component timer2us;

signal begin_time : std_logic;
signal finish_time :std_logic ;
begin

fsm : backdoor port map (
           clk      =>clk ,
           rst       => rst,
           timer => finish_time,
           start_count =>begin_time ,
           data_in => data_in ,
           output => output);
 timer : timer2us port map (
           clk => clk,
           rst => rst,
           enable => begin_time,
           timeout => finish_time);
            

end Behavioral;
