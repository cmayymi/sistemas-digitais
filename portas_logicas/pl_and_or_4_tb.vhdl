entity pl_and_or_4_tb is 
    -- entidade vazia
end pl_and_or_4_tb;

architecture tb of pl_and_or_4_tb is
    -- subentidade

    -- and
    component pl_and_4 is
        port(
            A : in bit;
            B : in bit;
            C : in bit;
            D : in bit;
            S : out bit
        );
    end component;

    -- or
    component pl_or_4 is
        port(
            A : in bit;
            B : in bit;
            C : in bit;
            D : in bit;
            S : out bit
        );
    end component;

        -- sinais
    signal sA, sB, sC, sD : bit;
    signal sAND, sOR : bit;

begin
    u2_pl_and_4 : pl_and_4 port map(sA, sB, sC, sD, sAND);
    u2_pl_or_4 : pl_or_4 port map(sA, sB, sC, sD, sOR);

    u3_tb : process
	begin
        -- linhas da tabela-verdade
		sA <= '0';
		sB <= '0';
        sC <= '0';
		sD <= '0';
		wait for 10 ns;

		sA <= '0';
		sB <= '0';
        sC <= '0';
		sD <= '1';
		wait for 10 ns;

		sA <= '0';
		sB <= '0';
        sC <= '1';
		sD <= '0';
		wait for 10 ns;

		sA <= '0';
		sB <= '0';
        sC <= '1';
		sD <= '1';
		wait for 10 ns;

        sA <= '0';
		sB <= '1';
        sC <= '0';
		sD <= '0';
		wait for 10 ns;

        sA <= '0';
		sB <= '1';
        sC <= '0';
		sD <= '1';
		wait for 10 ns;

        sA <= '0';
		sB <= '1';
        sC <= '1';
		sD <= '0';
		wait for 10 ns;

        sA <= '0';
		sB <= '1';
        sC <= '1';
		sD <= '1';
		wait for 10 ns;

        sA <= '1';
		sB <= '0';
        sC <= '0';
		sD <= '0';
		wait for 10 ns;

        sA <= '1';
		sB <= '0';
        sC <= '0';
		sD <= '1';
		wait for 10 ns;

        sA <= '1';
		sB <= '0';
        sC <= '1';
		sD <= '0';
		wait for 10 ns;

        sA <= '1';
		sB <= '0';
        sC <= '1';
		sD <= '1';
		wait for 10 ns;

        sA <= '1';
		sB <= '1';
        sC <= '0';
		sD <= '0';
		wait for 10 ns;

        sA <= '1';
		sB <= '1';
        sC <= '0';
		sD <= '1';
		wait for 10 ns;

        sA <= '1';
		sB <= '1';
        sC <= '1';
		sD <= '0';
		wait for 10 ns;

        sA <= '1';
		sB <= '1';
        sC <= '1';
		sD <= '1';
		wait for 10 ns;
		
		wait;		
	end process u3_tb;

end tb;