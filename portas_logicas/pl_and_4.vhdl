-- fazer um circuito and com 2 portas logicas

-- ENTIDADE
entity pl_and_4 is
    port(
        A : in bit;
        B : in bit;
        C : in bit;
        D : in bit;
        S : out bit
    );
end pl_and_4;

-- COMPORTAMENTO
architecture comportamento of pl_and_4 is
begin
    S <= A and B and C and D;
end comportamento;