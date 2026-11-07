library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_menor is
end entity tb_menor;

architecture sim of tb_menor is

  -- Solo se declaran las señales internas, sin bloque "component"
  signal A : std_logic_vector(3 downto 0) := (others => '0');
  signal B : std_logic_vector(3 downto 0) := (others => '0');
  signal Y : std_logic_vector(3 downto 0);

begin

  -- Instanciacion directa de la entidad 
  uut: entity work.menor
    port map (
      A => A, 
      B => B,
      Y => Y
    );

  -- Proceso para probar diferentes combinaciones
  process
  begin
    A <= "0010"; B <= "0101"; wait for 10 ns;
    A <= "1000"; B <= "0011"; wait for 10 ns;
    A <= "0111"; B <= "0111"; wait for 10 ns;
    A <= "0000"; B <= "1111"; wait for 10 ns;
    A <= "1111"; B <= "0000"; wait for 10 ns;
    wait;
  end process;

end architecture sim;