-- fazer um circuito and com 2 portas logicas

-- ENTIDADE
entity pl_or_4 is
    port(
        A : in bit;
        B : in bit;
        C : in bit;
        D : in bit;
        S : out bit
    );
end pl_or_4;

-- COMPORTAMENTO
architecture comportamento of pl_or_4 is
begin
    S <= A or B or C or D;
end comportamento;