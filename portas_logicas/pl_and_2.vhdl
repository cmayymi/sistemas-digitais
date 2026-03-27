-- fazer um circuito and com 2 portas logicas

-- ENTIDADE
entity pl_and_2 is
    port(
        A : in bit;
        B : in bit;
        S : out bit
    );
end pl_and_2;

-- COMPORTAMENTO
architecture comportamento of pl_and_2 is
begin
    S <= A and B;
end comportamento;