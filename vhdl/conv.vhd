----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2022 13:08:58
-- Design Name: 
-- Module Name: conv - Behavioral
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

entity conv is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           srt : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC;
           timer_start : out STD_LOGIC;
           timer_done : in STD_LOGIC);
end conv;

architecture Behavioral of conv is
type state is (start, verification, send_1, send_0);
signal current_state : state;
signal i : integer range 0 to 15 ;

begin
process(clk, rst)
begin
if rst='1' then 
    data_out <= '0' ;
elsif rising_edge (clk) then
    case current_state is 
        when start  => if srt ='1' then
                        current_state   <= verification;
                        timer_start     <= '0';
                        data_out        <= '0';
                        i               <= 0 ;
                       else
                        current_state   <= start;
                        timer_start     <= '0';
                        data_out        <= '0';
                       end if;
                       
        when verification  => if data_in(i) ='1' and i <= 15 then
                        current_state   <= send_1;
                        timer_start     <= '1';
                        data_out        <= '1'; 
                        i               <= i + 1;                     
                       elsif data_in(i) ='0' and i <= 15 then 
                        current_state   <= send_0;
                        timer_start     <= '1';
                        data_out        <= '0';
                        i               <= i + 1;
                        elsif i >= 16 then
                        current_state   <= start;
                       else
                        current_state   <= verification;
                        timer_start     <= '0';
                        data_out        <= '0';
                       end if;
                       
        when send_1  => if timer_done ='1' and i <=  15 then
                        current_state   <= verification;
                        timer_start     <= '0';
                        data_out        <= '0';
                       elsif timer_done ='1' and i > 15 then
                        current_state   <= start;
                       else
                        current_state   <= send_1;
                        timer_start     <= '1';
                        data_out        <= '1';
                       end if;         
        when send_0  => if timer_done ='1' and i <= 15 then
                        current_state   <= verification;
                        timer_start     <= '0';
                        data_out        <= '0';
                        elsif timer_done ='1' and i > 15 then
                        current_state   <= start;
                       else
                        current_state   <= send_0 ;
                        timer_start     <= '1';
                        data_out        <= '0';
                       end if;
        when others => current_state <= start;
end case;
end if;
end process;        

end Behavioral;
