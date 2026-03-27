entity not8bits is
    port(
        y : in  bit_vector(7 downto 0);
        s   : out bit_vector(7 downto 0)
    );
end entity;

architecture negacao8bits of not8bits is
begin
    s(0) <= not y(0);
    s(1) <= not y(1);
    s(2) <= not y(2);
    s(3) <= not y(3);
    s(4) <= not y(4);
    s(5) <= not y(5);
    s(6) <= not y(6);
    s(7) <= not y(7);
end architecture;