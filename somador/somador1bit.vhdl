entity somador1bit is
    port (
        a : in bit;
        b : in bit;
        cin : in bit;
        cout : out bit;
        s : out bit
    );
end entity;

architecture somar of somador1bit is
begin
    s <= (a xor b) xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end architecture;