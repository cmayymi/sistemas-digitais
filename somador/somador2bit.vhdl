entity somador2bit is
    port (
        a : in bit_vector (1 downto 0);
        b : in bit_vector (1 downto 0);
        cin : in bit;
        cout : out bit;
        s : out bit_vector (1 downto 0)
    );
end entity;

architecture somar of somador2bit is

component somador1bit is
    port (
        a : in bit;
        b : in bit;
        cin : in bit;
        cout : out bit;
        s : out bit
    );
end component;

signal carry : bit;

begin
    u_somador0 : somador1bit port map(a(0), b(0), '0', carry, s(0));
    u_somador1 : somador1bit port map(a(1), b(1), carry, cout, s(1));

end architecture;