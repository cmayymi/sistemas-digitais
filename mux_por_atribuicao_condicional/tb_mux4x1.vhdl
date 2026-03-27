-- ghdl -a mux2x1.vhdl tb_mux2x1.vhdl
-- ghdl -r tb_mux2x1 --stop-time=80ns --wave=tb_mux2x1.ghw

entity tb_mux4x1 is

end entity;

architecture comuta of tb_mux4x1 is
    component mux4x1 is
        port(
            c0 : in  bit;
            c1 : in  bit;
            c2 : in bit;
            c3 : in bit;
            sel : in  bit_vector(1 downto 0);
            zcm : out bit   -- saída por porta lógica
        );
    end component;

    signal sc0, sc1, sc2, sc3, szcm : bit;
    signal ssel : bit_vector(1 downto 0);
begin

    u_mux4x1 : mux4x1 port map
    (sc0, sc1, sc2, sc3, ssel,szcm); -- canal 1, 2, 3, 4, seletor e saida 

    u_tb : process
    begin
        sc0 <= '0';

        sc1 <= '0';

        sc2 <= '1';

        sc3 <= '1';

        ssel <= "00";
        wait for 10 ns;

        ssel <= "10";
        wait for 10 ns;

        ssel <= "01";
        wait for 10 ns;

        ssel <= "11";
        wait for 10 ns;

        wait;
    end process;
    

end architecture;
