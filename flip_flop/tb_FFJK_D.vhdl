library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjkd is
    -- entidade vazia
end tb_ffjkd;

architecture test of tb_ffjkd is
    constant CLK_PERIOD : time := 20 ns;

    component ffjkd is
    port(
        d : in  std_logic;
        clock : in  std_logic;
        pr, cl: in  std_logic;
        q, nq : out std_logic
    );
    end component;

    signal sd, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin
    -- instância do D e port map
    u_ffd : ffjkd port map
    (sd, sclk, spr, scl, sq, snq);

    -- process 
    tbp : process
    begin
        -- estado inicial
        spr <= '1';  
        scl <= '0';  
        sd  <= '0';
        wait for CLK_PERIOD;

        -- desativação de clear (clear=1 -> inativo)
        scl <= '1';
        wait for CLK_PERIOD;

        -- alterações em d
        sd <= '0';
        wait for CLK_PERIOD;

        sd <= '1';
        wait for CLK_PERIOD;

        sd <= '1';
        wait for CLK_PERIOD;

        sd <= '0';
        wait for CLK_PERIOD;

    end process;

    -- process para Clock 
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;

end architecture test;
