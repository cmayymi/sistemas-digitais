-- fazer um circuito and com 2 portas logicas

-- ENTIDADE
entity pl_xnor_2 is
    port(
        A : in bit;
        B : in bit;
        S : out bit
    );
end pl_xnor_2;

-- COMPORTAMENTO
architecture comportamento of pl_xnor_2 is
begin
    S <= A xnor B;
end comportamento;