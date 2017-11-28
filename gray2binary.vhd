--Gray to Binary converter
library ieee;
use ieee.std_logic_1164.all;

entity gray2bin is
	port(i: in bit_vector(7 downto 0);
		 o: out bit_vector(7 downto 0));

end gray2bin;

architecture g2b of gray2bin
	begin
		process(i)
			variable t:bit_vector(7 downto 0);
			t(7):=i(7);
			 for j in 0 to 6 loop
			 	t(j):= (i(j) XOR t(j+1));
			 end loop;
			 o<=t;
		end process;
end g2b;

entity testg2b is
end testg2b;

architecture g2b of testg2b is
	component gray2bin
		port(i:in bit_vector(7 downto 0);
		o:out bit_vector(7 downto 0));
		end component;
		signal i,o:bit_vector(7 downto 0);
		begin
		 i1:gray2bin port map(i,o);
		 process begin
		 	i<="10001000"; wait for 5 ns;
		 	i<="10101010"; wait for 5 ns;
		 	i<="11110000"; wait for 5 ns;
		 	i<="11111010"; wait for 5 ns;
		 end process;
		end g2b;


