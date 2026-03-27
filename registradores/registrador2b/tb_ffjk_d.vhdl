library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjk_d is
 -- entidade vazia
end tb_ffjk_d;

architecture testd of tb_ffjk_d is
    constant CLK_PERIOD : time := 20 ns;

    component ffjk_d is
    port(
        d : in std_logic;
        clock : in std_logic;
        pr, cl : in std_logic;
        q, nq : out std_logic
    );
    end component;

    signal sd, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin
 -- instancia do D e port map
    u_ffjk_d : ffjk_d port map(sd, sclk, spr, scl, sq, snq);

    -- process
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        sd <= '0';
        wait for CLK_PERIOD;

        -- desativação de clear
        --clear em 1 significa que o sinal foi desativado
        --pr = 1 e cl = 1 significa que haverá o funcionamento do ffjk básico (com clock)

        scl <= '1';
        wait for CLK_PERIOD;

        -- TESTE 1    
        sd <= '0';                  -- D = 0
        wait for CLK_PERIOD;        -- Q = 0
    
        -- TESTE 2;
        sd <= '1';              -- D = 1
        wait for CLK_PERIOD;    -- Q = 1
    
        -- TESTE 3
        sd <= '0';
        wait for CLK_PERIOD;    

    
        -- TESTE 4
        sd <= '1';
        wait for CLK_PERIOD;

    end process;

 -- process para Clock
 p_clock : process
 begin
    sclk <= not(sclk);
    wait for CLK_PERIOD/2;
    end process;

end architecture testd;
