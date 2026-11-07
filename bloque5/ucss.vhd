-- Diego Eustaquio, Angel Camacho, Omar Alpides, isaac Sandoval
-- 06/ 11/ 2026
-- en este archivo se juntan los 4 modulos previamente realizados para la logica principal (selector, enable, prioridades).
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ucss is 
    port (
        A, B, U : in std_logic_vector(3 downto 0);
        sel: in std_logic_vector(1 downto 0);
        en, modo: in std_logic;
        Y : out std_logic_vector(3 downto 0)

    );
end ucss;

architecture estructural of ucss is

component menor is
  port (
    A, B: in  std_logic_vector(3 downto 0);
    Y : out std_logic_vector(3 downto 0)
  );
end component;

component mayor_que is
    port (
        A, B : in std_logic_vector(3 downto 0);
        Y : out std_logic_vector(3 downto 0)
    );
end component;

component igualdad is
    port (
        A, B : in std_logic_vector(3 downto 0);
        Y : out std_logic_vector(3 downto 0)
    );
end component;

component maximo is
    port (
        A : in  std_logic_vector(3 downto 0); 
        B : in  std_logic_vector(3 downto 0);
        Y : out std_logic_vector(3 downto 0)
    );
end component;


signal R, r_mayor, r_menor, r_max, r_igual: std_logic_vector(3 downto 0);

begin


  -- conectamos los componentes con las variables 
    u1 : igualdad 
        port map (
            A => A,
            B => B,
            Y => r_igual
        );
    u2 : mayor_que   
        port map (
            A => A,
            B => B,
            Y => r_mayor
        );
    u3 : menor    
        port map (
            A => A,
            B => B, 
            Y => r_menor
        );
     u4 : maximo 
        port map (
            A => A, 
            B => B,
            Y => r_max
        );

  -- usamos un case para ver que procedimiento se va a usar segun el sel
  process (sel, r_igual, r_mayor, r_menor, r_max)
  begin
    case sel is
      when "00"   => R <= r_igual;
      when "01"   => R <= r_mayor;
      when "10"   => R <= r_menor;
      when "11"   => R <= r_max;
      when others => R <= "0000";
    end case;
  end process;

  -- aqui realizamos las prioridades descritas en el archivo
  process (en, modo, R, U)
  begin
    if en = '0' then
      Y <= "0000";
    elsif modo = '1' then
      if unsigned(R) > unsigned(U) then
        Y <= U;
      else
        Y <= R;
      end if;
    else
      Y <= R;
    end if;
  end process;

end estructural;