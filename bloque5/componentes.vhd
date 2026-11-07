
-- Archivo: componentes.vhd
-- Autor: [Rodrigo Diego BArbosa]
-- Fecha: 06/11/2026
-- Descripción: Entidad Top-Level para síntesis en FPGA Gowin.
--              Conecta los switches, botones y LEDs físicos con el módulo UCSS.


library ieee;
use ieee.std_logic_1164.all;

entity componentes is
    port (
        sw  : in  std_logic_vector(13 downto 0); -- Switches físicos
        btn : in  std_logic_vector(1 downto 0);  -- Botones físicos
        led : out std_logic_vector(3 downto 0)   -- LEDs de salida
    );
end entity componentes;

architecture structural of componentes is

    --Componente principal UCSS
    component ucss is
        port (
            A    : in  std_logic_vector(3 downto 0);
            B    : in  std_logic_vector(3 downto 0);
            U    : in  std_logic_vector(3 downto 0);
            sel  : in  std_logic_vector(1 downto 0);
            en   : in  std_logic;
            modo : in  std_logic;
            Y    : out std_logic_vector(3 downto 0)
        );
    end component ucss;

begin

    -- Instanciacion y mapeo de puertos hacia los pines fisicos
    U_UCSS : ucss
        port map (
            A    => sw(3 downto 0),   -- Operando A (4 bits)
            B    => sw(7 downto 4),   -- Operando B (4 bits)
            U    => sw(11 downto 8),  -- Umbral de saturación U (4 bits)
            sel  => sw(13 downto 12), -- Selector de operación (2 bits)
            en   => btn(0),           -- Habilitación (Prioridad 1)
            modo => btn(1),           -- Modo: '0' Normal, '1' Saturación
            Y    => led(3 downto 0)   -- Salida final hacia los 4 LEDs
        );

end architecture structural;