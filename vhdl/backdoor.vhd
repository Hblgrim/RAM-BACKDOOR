----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2022 14:13:39
-- Design Name: 
-- Module Name: backdoor - Behavioral
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

entity backdoor is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           timer : in std_logic;
           start_count : out std_logic;
           data_in : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC);
end backdoor;

architecture Behavioral of backdoor is

type state is (s_0, s_1, s_2, s_3);
signal current_state : state;

begin
process(clk, rst)
begin
if rst ='1' then 
    output <= '1';
elsif rising_edge(clk) then
    case current_state is
        when s_0 => if data_in = "110"  then
                    current_state <= s_1;
                    start_count <= '1';
                    output <= '0';
                    else
                    current_state <= s_0;
                    output <= '0';
                    end if;
        when s_1 => if data_in = "100" and timer ='1' then
                    current_state <= s_2;
                    start_count <= '1';
                    output <= '0';
                    else
                    current_state <= s_1;
                    output <= '0';
                    end if;
        when s_2 => if data_in = "010" and timer ='1'then
                    current_state <= s_3;
                    start_count <= '0';
                    output <= '0';
                    else
                    current_state <= s_2;
                    output <= '0';
                    end if;  
        when s_3 => 
                    current_state <= s_0;
                    start_count <= '1';
                    output <= '1';
                       
        when others => current_state <= s_0;                                                                          
end case ; 
end if;
end process;          
end Behavioral;
