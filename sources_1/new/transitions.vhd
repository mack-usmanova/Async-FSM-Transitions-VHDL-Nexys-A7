----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2025 04:12:14 PM
-- Design Name: 
-- Module Name: transitions - Behavioral
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

entity transitions is
  Port ( 
        X1, X2, RESET: in std_logic;
        Y1, Y2, Y3: inout std_logic;
        X1_LED, X2_LED, Z: out std_logic
  );
end transitions;

architecture Behavioral of transitions is

begin

     Y1 <= ((y1 and y2 and y3)
            or (x2 and y1)
            or (x1 and y1 and y2)
            or (not(x1) and y1 and y3)
            or (not(x1) and not(x2) and not(y1) and y3)
            or (not(x1) and x2 and not(y2) and not(y3))
            or (not(x1) and y1 and not(y2))) and reset;
     
     
     Y2 <= ((not(x1) and x2 and y1 and y3)
            or (not(x1) and y1 and y2 and not(y3))
            or (not(x1) and x2 and y1 and y2)) and reset;
     
     
     Y3 <= ((not(x2) and y3)
            or (x1 and y2 and y3)
            or (not(x1) and not(y1) and y3)
            or (not(x1) and not(y2) and y3)
            or (not(y1) and y2 and y3)
            or (not(x1) and not(x2) and y1 and not(y2))) and reset;
    
    
     Z <= (not(y1) and y3)
            or (y1 and y2 and not(y3))
            or (not(x1) and not(x2) and not(y1))
            or (not(x1) and not(x2) and y2 and not(y3));

x1_led <= x1;
x2_led <= x2;


end Behavioral;
