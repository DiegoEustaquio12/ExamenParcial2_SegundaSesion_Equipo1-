-- Isaac Sandoval Huerta
-- Fecha: 6/11/2026
-- Archivo Módulo de selección máximo entre A y B

-- Importación de librerías
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maximo is
    port (
        A : in  std_logic_vector(3 downto 0); 
        B : in  std_logic_vector(3 downto 0);
        Y : out std_logic_vector(3 downto 0)
    );
end entity maximo;
    

architecture behavioral of maximo is
begin
    Y <= A when unsigned(A) >= unsigned(B) else B; -- Convierte A y B en números positivos enteros y los compara
end architecture behavioral;