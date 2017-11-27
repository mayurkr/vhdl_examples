-- 4:1 Multiplexer
library ieee;
use ieee.std_logic_1164.all;

entity mux4x1 is 
 	port(a,b,c,d,s0,s1: in std_logic;
 		 y: out std_logic);

end mux4x1;

architecture mux_arc of mux_4x1 is
	begin
		process(a,b,c,d,s0,s1)
			variable sel:integer range 0 to 3;
		begin
			sel:=0;

			if(s0="1") then sel:=sel+1;
			end if;

			if(s1="1") then sel:=sel+2;
			end if;

			case sel is
				when 0 => y<=a;
				when 1 => y<=b;
				when 2 => y<=c;
				when 3 => y<=d;

			end case;
		end process;
end mux_arc;






