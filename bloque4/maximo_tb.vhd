library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_maximo is
end entity;

architecture sim of tb_maximo is
    signal A, B : std_logic_vector(3 downto 0);
    signal Y : std_logic_vector(3 downto 0);
begin

    -- Instanciacion directa del componente
    uut: entity work.maximo
    port map (
        A => A, B => B,
        Y => Y
    );

    -- Proceso 
    process
    begin
        -- Formato: A | B | tiempo de espera 
        A <= "0000"; B <= "0000"; wait for 10 ns; -- A=0, B=0  -> Y=0000 (0)
        A <= "0101"; B <= "0010"; wait for 10 ns; -- A=5, B=2  -> Y=0101 (5)
        A <= "0011"; B <= "1000"; wait for 10 ns; -- A=3, B=8  -> Y=1000 (8)
        A <= "1111"; B <= "1111"; wait for 10 ns; -- A=15, B=15 -> Y=1111 (15)
        A <= "0000"; B <= "1111"; wait for 10 ns; -- A=0, B=15 -> Y=1111 (15)
        A <= "1010"; B <= "0111"; wait for 10 ns; -- A=10, B=7  -> Y=1010 (10)
        
        
        wait;
    end process;

end sim;