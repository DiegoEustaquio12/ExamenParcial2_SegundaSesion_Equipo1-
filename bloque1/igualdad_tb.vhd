library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_igualdad is
end entity;

architecture sim of tb_igualdad is
    signal A, B : std_logic_vector(3 downto 0);
    signal Y : std_logic_vector(3 downto 0);
begin

    uut: entity work.igualdad
    port map (
        A => A, B => B,
        Y => Y
    );

    process
    begin
        A <= "0000"; B <= "0000"; wait for 10 ns;
        A <= "0000"; B <= "0001"; wait for 10 ns;
        A <= "1010"; B <= "1010"; wait for 10 ns;
        A <= "1111"; B <= "1110"; wait for 10 ns;
        A <= "0101"; B <= "0101"; wait for 10 ns;
        wait;
    end process;

end sim;