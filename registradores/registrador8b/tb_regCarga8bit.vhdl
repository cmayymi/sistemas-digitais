library ieee;
use ieee.std_logic_1164.all;

entity tb_reg8 is
    -- entidade vazia
end tb_reg8;

architecture tb of tb_reg8 is
    constant CLK_PERIOD : time := 20 ns;

    component regCarga8bit is
    port(
        d : in std_logic_vector(7 downto 0);
        clock : in std_logic;
        pr, cl : in std_logic; 
        nrw : in std_logic;
        s : out std_logic_vector(7 downto 0)
    );
    end component regCarga8bit;

    signal sd : std_logic_vector(7 downto 0);
    signal sclk : std_logic := '1';
    signal spr, scl, snrw : std_logic;
    signal ss : std_logic_vector(7 downto 0);

begin
    u1 : regCarga8bit port map(sd, sclk, spr, scl, snrw, ss);

    -- process 
    tbp : process
    begin
        -- reset do circuito
        spr <= '1';  
        scl <= '0';  
        sd  <= "00000000";
        snrw <= '0';
        wait for CLK_PERIOD;

        -- gravacao do numero 14
        scl <= '1';
        sd <= "00001110";
        snrw <= '1';
        wait for CLK_PERIOD;

        -- gravacao do numero 237
        sd <= "11101101";
        snrw <= '1';
        wait for CLK_PERIOD;

        -- sem gravacao por um ciclo
        wait for CLK_PERIOD;

        -- gravacao do numero 255
        sd <= "11111111";
        snrw <= '1';
        wait for CLK_PERIOD;

        -- sem gravacao por um ciclo
        wait for CLK_PERIOD;

        -- gravacao do numero 0
        sd  <= "00000000";
        snrw <= '1';
        wait for CLK_PERIOD;

        -- sem gravacao por um ciclo
        wait for CLK_PERIOD;
        wait;
    end process tbp;

    clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process clock;

end architecture tb;
