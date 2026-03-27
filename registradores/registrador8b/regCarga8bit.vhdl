library ieee;
use ieee.std_logic_1164.all;

entity regCarga8bit is
    port(
        d : in std_logic_vector(7 downto 0);
        clock : in std_logic;
        pr, cl : in std_logic; 
        nrw : in std_logic;
        s : out std_logic_vector(7 downto 0)
    );
end entity;

architecture reg8bit of regCarga8bit is
    component regCarga1bit is
    port(
        d : in std_logic;
        clock : in std_logic;
        pr, cl : in std_logic; 
        nrw : in std_logic;
        s : out std_logic
    );
    end component;

begin 
    -- instâncias de regCarga1bit (8 vezes)
    u_reg0 : regCarga1bit port map(d(0), clock, pr, cl, nrw, s(0));
    u_reg1 : regCarga1bit port map(d(1), clock, pr, cl, nrw, s(1));
    u_reg2 : regCarga1bit port map(d(2), clock, pr, cl, nrw, s(2));
    u_reg3 : regCarga1bit port map(d(3), clock, pr, cl, nrw, s(3));
    u_reg4 : regCarga1bit port map(d(4), clock, pr, cl, nrw, s(4));
    u_reg5 : regCarga1bit port map(d(5), clock, pr, cl, nrw, s(5));
    u_reg6 : regCarga1bit port map(d(6), clock, pr, cl, nrw, s(6));
    u_reg7 : regCarga1bit port map(d(7), clock, pr, cl, nrw, s(7));
    -- como alternativa e sugestão, é possível trocar as 8 linhas anteriores
    -- por um generate do VHDL!
end architecture;