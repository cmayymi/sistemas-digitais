entity tb_somador1bit is
    -- entidade vazia
end entity;


architecture somar of tb_somador1bit is
    component somador1bit is
        port(
            a : in bit;
            b : in bit;
            cin : in bit;
            cout : out bit;
            s : out bit
        );
    end component;

    signal sa, sb, scin, scout, ss : bit;

begin
    u_somador : somador1bit port map (sa, sb, scin, scout, ss);

    tbp : process
    begin
            sa <= '1';
            sb <= '0';
            scin <= '0';
            wait for 10 ns;

            sa <= '1';
            sb <= '1';
            scin <= '1';
            wait for 10 ns;
    wait;
    end process;
end architecture somar;