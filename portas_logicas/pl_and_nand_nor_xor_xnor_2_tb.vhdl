entity pl_and_nand_nor_xor_xnor_2_tb is
    -- entidade vazia
end pl_and_nand_nor_xor_xnor_2_tb;

architecture tb of pl_and_nand_nor_xor_xnor_2_tb is 
    -- subentidade

    -- and
    component pl_and_2 is
        port(
            A : in bit;
            B : in bit;
            S : out bit
        );
    end component;

    -- nand
    component pl_nand_2 is
        port(
            A : in bit;
            B : in bit;
            S : out bit
        );
    end component;

    -- nor
    component pl_nor_2 is
        port(
            A : in bit;
            B : in bit;
            S : out bit
        );
    end component;

    -- xor
    component pl_xor_2 is
        port(
            A : in bit;
            B : in bit;
            S : out bit
        );
    end component;

    -- xnor
    component pl_xnor_2 is
        port(
            A : in bit;
            B : in bit;
            S : out bit
        );
    end component;

    -- sinais
    signal sA, sB : bit;
    signal sAND, sNAND, sNOR, sXOR, sXNOR : bit;

begin 
    u2_pl_and_2 : pl_and_2 port map(sA, sB, sAND);
    u2_pl_nand_2 : pl_nand_2 port map(sA, sB, sNAND);
    u2_pl_nor_2 : pl_nor_2 port map(sA, sB, sNOR);
    u2_pl_xor_2 : pl_xor_2 port map(sA, sB, sXOR);
    u2_pl_xnor_2 : pl_xnor_2 port map(sA, sB, sXNOR);

    u3_tb : process
	begin
        -- linhas da tabela-verdade
		sA <= '0';
		sB <= '0';
		wait for 10 ns;

		sA <= '0';
		sB <= '1';
		wait for 10 ns;

		sA <= '1';
		sB <= '0';
		wait for 10 ns;

		sA <= '1';
		sB <= '1';
		wait for 10 ns;
		
		wait;		
	end process u3_tb;

    end tb;