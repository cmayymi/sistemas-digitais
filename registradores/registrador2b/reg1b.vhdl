library ieee;
use ieee.std_logic_1164.all;
entity reg1b is
    port(
        d : in std_logic;
        clk : in std_logic;
        pr, cl : in std_logic; 
        nrw : in std_logic;
        s : out std_logic
    );
end entity;

architecture reg of reg1b is
    component ffjk_d is
        port(
            d : in std_logic;
            clock : in std_logic;
            pr, cl : in std_logic;
            q, nq : out std_logic
    );
    end component;

 signal datain, dataout : std_logic;

begin
    -- envio de dataout para saída s
    s <= dataout;       -- q é a saída do FFJK Tipo D

    -- MUXLTIPLEXADOR
    -- nrw = 1 -> entrada principal de interface d
    -- nrw = 0 -> saida temporária dataout (mantém estado)
    datain <= dataout when nrw = '0' else d;  
 
    -- instância do reg
    u_reg : ffjk_d port map(datain, clk, pr, cl, dataout);    --datain vai para d; clock vai para o clock; pr para pr; cl para cl; dataout para q;

end architecture;
