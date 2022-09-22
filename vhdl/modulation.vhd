----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2022 19:29:16
-- Design Name: 
-- Module Name: modulation - Behavioral
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

entity modulation is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ook : in STD_LOGIC;
           timer_s : out std_logic;
           timer_d : in std_logic ;
           in_data : in STD_LOGIC;
           out_data : out STD_LOGIC);
end modulation;

architecture Behavioral of modulation is
type state is (start, verification,out_1, out_0);
signal current_state : state;
begin
 process(clk, rst)
begin
if rst='1' then 
    out_data <= '0' ;
elsif rising_edge (clk) then
    case current_state is 
        when start  => if ook ='1' then
                        current_state   <= verification;
                        timer_s         <= '0';
                        out_data        <= '0';
                       else
                        current_state   <= start;
                        timer_s         <= '0';
                        out_data        <= '0';
                       end if;
                       
        when verification  => if in_data ='1' then
                        current_state   <= out_1;
                        timer_s         <= '1';
                        out_data        <= '1'; 
                       elsif in_data ='0'  then 
                        current_state   <= out_0;
                        timer_s         <= '1';
                        out_data        <= '0';
                       else
                        current_state   <= verification;
                        timer_s         <= '0';
                        out_data        <= '0';
                       end if;
                       
        when out_1  => if timer_d ='1' and in_data ='1' then
                        current_state   <= out_0;
                        timer_s         <= '0';
                        out_data        <= '0';
                       elsif timer_d ='1' and in_data ='0' then
                        current_state   <= verification;
                        timer_s         <= '0';
                        out_data        <= '0';
                       else
                        current_state   <= out_1;
                        timer_s         <= '1';
                        out_data        <= '1';
                       end if;         
        when out_0  => if timer_d ='1' and in_data ='1' then
                        current_state   <= out_1;
                        timer_s         <= '0';
                        out_data        <= '1';
                        elsif timer_d ='1' and in_data ='0' then
                        current_state   <= verification;
                        timer_s         <= '0';
                        out_data        <= '0';                        
                       else
                        current_state   <= out_0 ;
                        timer_s         <= '1';
                        out_data        <= '0';
                       end if;
        when others => current_state <= start;
end case;
end if;
end process;
end Behavioral;
