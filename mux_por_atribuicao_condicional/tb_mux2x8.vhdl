-- ghdl -a mux2x8.vhdl tb_mux2x8.vhdl
-- ghdl -r tb_mux2x8 --stop-time=20ns --wave=tb_mux2x8.ghw

entity tb_mux2x8 is

end entity;

architecture comuta of tb_mux2x8 is
    component mux2x8 is
        port(
            x  : in  bit_vector(7 downto 0);
            y  : in  bit_vector(7 downto 0);
            sel : in  bit;
            s  : out bit_vector(7 downto 0)
        );
    end component;

    signal sx  : bit_vector(7 downto 0);
    signal sy  : bit_vector(7 downto 0);
    signal ssel : bit;
    signal ss  : bit_vector(7 downto 0);
begin

    u_mux2x8 : mux2x8 port map
    (sx,    -- canal 0
     sy,    -- canal 1
     ssel,   -- seletor
     ss);   -- saídas com comando vhdl

    u_tb : process
    begin
        sx <= "00000001";

        sy <= "00001100";

        ssel <= '0';
        wait for 10 ns;

        ssel <= '1';
        wait for 10 ns;

        wait;
    end process;
    

end architecture;
