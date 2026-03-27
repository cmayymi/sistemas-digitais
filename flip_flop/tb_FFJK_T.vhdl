library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjkt is
    -- entidade vazia
end tb_ffjkt;

architecture test of tb_ffjkt is
    constant CLK_PERIOD : time := 20 ns;

    component ffjkt is
        port(
            t : in  std_logic;
            clock : in  std_logic;
            pr, cl: in  std_logic;
            q, nq : out std_logic
        );
    end component;

    signal st, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin
    -- instância do FF tipo T
    u_fft : ffjkt port map
    (st, sclk, spr, scl, sq, snq);

    -- process
    tbp : process
    begin
        -- estado inicial
        spr <= '1';   
        scl <= '0';   
        st  <= '0';
        wait for CLK_PERIOD;

        -- desativação do clear (clear=1 -> inativo)
        scl <= '1';
        wait for CLK_PERIOD;

        st <= '0'; -- T=0, Q deve manter o valor
        wait for CLK_PERIOD;

        st <= '1'; -- T=1, Q deve inverter
        wait for CLK_PERIOD;

        st <= '0'; -- T=0, mantém o estado atual
        wait for CLK_PERIOD;

        st <= '1'; -- T=1, inverte novamente
        wait for CLK_PERIOD;

        st <= '1'; -- permanece em 1 → vai alternar a cada clock
        wait for CLK_PERIOD;

    end process;

    -- processo para clock
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;

end architecture test;
