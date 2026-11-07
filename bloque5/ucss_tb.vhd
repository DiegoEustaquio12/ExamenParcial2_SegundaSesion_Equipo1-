library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ucss is
end entity;

architecture sim of tb_ucss is
    signal A, B, U : std_logic_vector(3 downto 0);
    signal sel : std_logic_vector(1 downto 0);
    signal en, modo : std_logic;
    signal Y : std_logic_vector(3 downto 0);
begin

    uut: entity work.ucss
    port map (
        A => A, B => B, U => U,
        sel => sel, en => en, modo => modo,
        Y => Y
    );

    process
    begin
        -- Caso 1: Deshabilitado
        A <= "0101"; B <= "0101"; U <= "1111"; sel <= "00"; en <= '0'; modo <= '0'; wait for 10 ns;

        -- Caso 2: Habilitado, modo normal
        en <= '1'; modo <= '0';
        sel <= "00"; A <= "0111"; B <= "0111"; wait for 10 ns; -- Iguales
        sel <= "00"; A <= "1000"; B <= "0001"; wait for 10 ns; 
        sel <= "01"; A <= "1010"; B <= "0011"; wait for 10 ns; -- Mayor
        sel <= "01"; A <= "0010"; B <= "1000"; wait for 10 ns; 
        sel <= "10"; A <= "0001"; B <= "0101"; wait for 10 ns; -- Menor
        sel <= "11"; A <= "0100"; B <= "1001"; wait for 10 ns; -- Máximo

        -- Caso 3: Habilitado, modo limite
        modo <= '1';
        sel <= "11"; A <= "0111"; B <= "1100"; U <= "1010"; wait for 10 ns; -- Limita a U (10)
        sel <= "11"; A <= "0111"; B <= "1100"; U <= "1111"; wait for 10 ns; -- Pasa R (12)

        wait;
    end process;
end sim;