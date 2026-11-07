--Autor: Angel Camacho Balderas
--Fecha: 06/11/2026
--Descripción: Este programa evalua si el valor A y B (compuestos de 4 bits), si A es mayor que B y dependiendo de la evaluación
--la salida sera 0001(si si es mayor) o 0000(si es cualquier otra cosa)
library IEEE;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity mayor_que is
    port (
        A, B : in std_logic_vector(3 downto 0);
        Y : out std_logic_vector(3 downto 0)
    );
end entity mayor_que;

architecture Behavioral of mayor_que is
begin
    --Comparación de si A es mayor que B se da a la salida Y su correspondido valor
    Y <= "0001" when unsigned(A) > unsigned(B) else "0000";
end architecture Behavioral;