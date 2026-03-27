library ieee;
use ieee.std_logic_1164.all;

entity tb_reg2b is 
    --entidade vazia
end tb_reg2b;

architecture tb of tb_reg2b is
    constant CLK_PERIOD : time := 20 ns;

    component reg2b is
        port(
            d : in std_logic_vector(1 downto 0);
            clk : in std_logic;
            pr : in std_logic;
            cl : in std_logic;
            nrw : in std_logic;
            s : out std_logic_vector(1 downto 0)
        );
    end component reg2b;

    signal sd : std_logic_vector(1 downto 0);
    signal sclk : std_logic := '1';
    signal spr, scl, snrw : std_logic;
    signal ss : std_logic_vector(1 downto 0);

begin 
        u1 : reg2b port map(sd, sclk, spr, scl, snrw, ss);

        tbp : process
        begin 
            spr <= '1';             --preset desativado
            scl <= '0';             --clear ativado
            sd <= "00";
            snrw <= '0';            --nrw = '0' não grava nada, apenas lê
            wait for CLK_PERIOD;

            --desativação do clear
            -- TESTE 1: Gravando 1
            scl <= '1';
            sd <= "01";
            snrw <= '1';
            wait for CLK_PERIOD;

            -- TESTE 2: Gravando 2
            sd <= "10";
            snrw <= '1';
            wait for CLK_PERIOD;

            --TEST 3: Sem gravação por um período de clock
            wait for CLK_PERIOD;

            --TESTE 4: Gravando 3
            sd <= "11";
            snrw <= '1';
            wait for CLK_PERIOD;

            --TESTE 5: Sem gravação por um período de clock
            wait for CLK_PERIOD;

            --TESTE 6: Gravando 0
            sd <= "00";
            snrw <= '1';
            wait for CLK_PERIOD;

            --TESTE 7: Sem gravação por um período de clock
            wait for CLK_PERIOD;

            wait;
        end process tbp;

    -- process para Clock
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;

end architecture tb;
