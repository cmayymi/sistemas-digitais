-- fazer um circuito and com 2 portas logicas

-- ENTIDADE
entity pl_nand_2 is
    port(
        A : in bit;
        B : in bit;
        S : out bit
    );
end pl_nand_2;

-- COMPORTAMENTO
architecture comportamento of pl_nand_2 is
begin
    S <= A nand B;
end comportamento;