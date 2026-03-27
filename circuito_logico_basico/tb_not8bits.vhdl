entity tb_not8bits is
end entity;

architecture negacao of tb_not8bits is
    component not8bits is
        port(
            y : in  bit_vector(7 downto 0);
            s : out bit_vector(7 downto 0)
        );
    end component;

    signal s_in  : bit_vector(7 downto 0);
    signal s_out : bit_vector(7 downto 0);
begin
    u_not8b : not8bits port map (y => s_in, s => s_out);

    process
    begin
        s_in <= "10101010";  
        wait for 10 ns;
        
        s_in <= "11110000";  
        wait for 10 ns;
        
        s_in <= "00000000";  
        wait for 10 ns;

        s_in <= "11111111";  
        wait for 10 ns;
        
        s_in <= "01010101"; 
        wait for 10 ns;

        wait;
    end process;

end architecture;