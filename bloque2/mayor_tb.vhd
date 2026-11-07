library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mayor_que is
end entity;

architecture sim of tb_mayor_que is
    signal A, B : std_logic_vector(3 downto 0);
    signal Y : std_logic_vector(3 downto 0);
begin

    -- Instanciacion directa del componente
    uut: entity work.mayor_que
    port map (
        A => A, B => B,
        Y => Y
    );

    -- Proceso 
    process
    begin
        -- Casos donde A NO es mayor que B (Salida esperada: "0000")
        A <= "0000"; B <= "0000"; wait for 10 ns; -- A=0, B=0  -> Y=0000
        A <= "0101"; B <= "1010"; wait for 10 ns; -- A=5, B=10 -> Y=0000
        A <= "1111"; B <= "1111"; wait for 10 ns; -- A=15, B=15 -> Y=0000
        
        -- Casos donde A SÍ es mayor que B (Salida esperada: "0001")
        A <= "1010"; B <= "0101"; wait for 10 ns; -- A=10, B=5 -> Y=0001
        A <= "1111"; B <= "0000"; wait for 10 ns; -- A=15, B=0 -> Y=0001
        A <= "1000"; B <= "0111"; wait for 10 ns; -- A=8, B=7  -> Y=0001
        
        
        wait;
    end process