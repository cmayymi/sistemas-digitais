entity mux2x8 is
    port(
        x  : in  bit_vector(7 downto 0);
        y  : in  bit_vector(7 downto 0);
        sel : in  bit;
        s  : out bit_vector(7 downto 0)
    );
end entity;

architecture comuta of mux2x8 is
begin
    -- comando vhdl de seleção de sinais
    s <= x when sel = '0' else y;

end architecture;
