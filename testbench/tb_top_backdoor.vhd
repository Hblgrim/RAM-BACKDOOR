----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2022 18:34:23
-- Design Name: 
-- Module Name: tb_top_backdoor - Behavioral
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

entity tb_top_backdoor is
--  Port ( );
end tb_top_backdoor;

architecture Behavioral of tb_top_backdoor is
component top_backdoor is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC);
end component  top_backdoor;

signal clk : std_logic ;
signal rst : std_logic ;
signal data_in : std_logic_vector( 2 downto 0);
signal s_output : std_logic ;
constant periode : time := 10 ns;
begin

U1 : top_backdoor port map (
            clk => clk,
           rst => rst,
           data_in => data_in,
           output => s_output);
  
 process 
 begin
 clk <= '1';
        wait for periode/2;
        clk <= '0';
        wait for periode/2;
 end process ;
 process
 begin
data_in <="111";
 wait for 3us;
 data_in <="110";
 wait for 3us;
  data_in <="100";
 wait for 3us;
  data_in <="010";
 wait for 3us;
 end process;
 rst <= '1', '0' after 20 ns ;
 


end Behavioral;
