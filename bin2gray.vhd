-- Binary to Gray converter
library ieee;
use ieee.std_logic_1164.all;

entity bin2gray is
 port(b:in bit_vector(7 downto 0);
 		g:out bit_vector(7 downto 0));
 end entity;

 architecture arc_b2g to bin2gray is
 	begin
 	process(b)
 		variable temp:bit_vector(7 downto 0);
 		begin
 		temp(7):=b(7);
 		for i in 0 to 6 loop
 		temp(i):=(b(i) XOR b(i+1));
 		end loop;
 	end process;
 	g<=temp;
 end arc_b2g;

 entity testb2g is
 end testb2g;
 
 architecture b2g of testb2g is
 	component bin2gray
 		port(b:in bit_vector(7 downto 0);
 			g:out bit_vector(7 downto 0));
 	end component;

 	begin
 	 i1:bin2gray port map(b,g);
 	 	process
 	 	begin
 	 	b<="00100100"; wait for 5 ns;
        b<="10101111"; wait for 5 ns;
        b<="10001000"; wait for 5 ns;
        b<="00001111"; wait for 5 ns;
        end process;
      end b2g;
