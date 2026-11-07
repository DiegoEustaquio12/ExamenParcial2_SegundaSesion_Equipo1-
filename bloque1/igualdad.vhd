--AUTOR: Omar Jahaziel Alpides Ruíz
--FECHA: 06/11/2026
--DESCRIPCIÓN: Programa que compara 2 números y ve si son iguales o no.

library IEEE;
use ieee.std_logic_1164.all;

entity igualdad is
    port (
        A, B : in std_logic_vector(3 downto 0);
        Y : out std_logic_vector(3 downto 0)
    );
end entity igualdad;

architecture Behavioral of igualdad is
    signal igual : std_logic;
begin
    igual <= (not(A(3) xor B(3))) and (not(A(2) xor B(2))) and (not(A(1) xor B(1))) and (not(A(0) xor B(0)));
    Y <= "0001" when igual = '1' else "0000";
end Behavioral;