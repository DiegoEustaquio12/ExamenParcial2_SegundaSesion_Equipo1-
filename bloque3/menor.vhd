-- Diego Alberto Eustaquio Arriaga
-- Fecha 06/11/2026
-- Aqui vamos a determinar la salida de Y con la operacion A<B en caso de que sel sea 1 0 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity menor is
  port (
    A, B: in  std_logic_vector(3 downto 0);
    Y : out std_logic_vector(3 downto 0)
  );
end entity menor;
 
architecture behavioral of menor is
begin
  Y <= "0001" when unsigned(A) < unsigned(B) else "0000";
end architecture behavioral;