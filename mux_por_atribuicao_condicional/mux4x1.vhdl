entity mux4x1 is
    port(
        c0 : in  bit;
        c1 : in  bit;
        c2 : in bit;
        c3 : in bit;
        sel : in  bit_vector(1 downto 0);
        zcm : out bit   -- saída por porta lógica
    );
end entity;

architecture comuta of mux4x1 is
begin
    -- comando vhdl de seleção de sinais
    zcm <= c0 when sel = "00" else
           c1 when sel = "01" else
           c2 when sel = "10" else
           c3 when sel = "11";

end architecture;

