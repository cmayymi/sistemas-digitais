-- fazer um circuito and com 2 portas logicas

-- ENTIDADE
entity pl_xor_2 is
    port(
        A : in bit;
        B : in bit;
        S : out bit
    );
end pl_xor_2;

-- COMPORTAMENTO
architecture comportamento of pl_xor_2 is
begin
    S <= A xor B;
end comportamento;