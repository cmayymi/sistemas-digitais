entity tb_somador2bit is
    -- entidade vazia
end entity;


architecture somar of tb_somador2bit is
    component somador2bit is
        port(
            a : in bit_vector(1 downto 0);
            b : in bit_vector(1 downto 0);
            cin : in bit;
            cout : out bit;
            s : out bit_vector(1 downto 0)
        );
    end component;

    signal sa, sb  : bit_vector(1 downto 0);
    signal scin, scout : bit;
    signal ss  : bit_vector(1 downto 0);

begin
    u_somador : somador2bit port map (sa, sb, scin, scout, ss);

    tbp : process
    begin
            sa <= "00";
            sb <= "11";
            scin <= '0';
            wait for 10 ns;

            sa <= "11";
            sb <= "11";
            scin <= '0';
            wait for 10 ns;
    wait;
    end process;
end architecture somar;