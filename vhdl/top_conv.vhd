----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2022 13:42:43
-- Design Name: 
-- Module Name: top_conv - Behavioral
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

entity top_conv is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC;
           activation : in STD_LOGIC);
end top_conv;

architecture Behavioral of top_conv is
component  timer_1u is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           timeout : out STD_LOGIC);
end component  timer_1u;

component  timer100n is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           timeout : out STD_LOGIC);
end component  timer100n;


component  conv is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           srt : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC;
           timer_start : out STD_LOGIC;
           timer_done : in STD_LOGIC);
end component conv;

component  modulation is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ook : in STD_LOGIC;
           timer_s : out std_logic;
           timer_d : in std_logic ;
           in_data : in STD_LOGIC;
           out_data : out STD_LOGIC);
end component modulation;
signal start_timer : std_logic;
signal done_timer : std_logic ;
signal start_timer100n : std_logic;
signal done_timer100n : std_logic ;
signal post_conv_data : std_logic;

begin

timer1u : timer_1u port map (
        clk     => clk,
        rst     => rst,
        enable  => start_timer,
        timeout => done_timer);

timer100 : timer100n port map (
        clk     => clk,
        rst     => rst,
        enable  => start_timer100n,
        timeout => done_timer100n);
        
conver : conv port map (
        clk     => clk,
        rst     => rst,
        srt     => activation,
        data_in => data_in,
        data_out=> post_conv_data,
        timer_start => start_timer,
        timer_done => done_timer);
        
modu : modulation port map (
        clk     => clk,
        rst     => rst,
        ook     => activation,
        in_data => post_conv_data,
        out_data=> data_out,
        timer_s => start_timer100n,
        timer_d => done_timer100n);       
              

end Behavioral;
