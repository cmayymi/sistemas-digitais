-- fazer um circuito and com 2 portas logicas

-- ENTIDADE
entity pl_or_3 is
    port(
        A : in bit;
        B : in bit;
        C : in bit;
        S : out bit
    );
end pl_or_3;

-- COMPORTAMENTO
architecture comportamento of pl_or_3 is
begin
    S <= A or B or C;
end comportamento;