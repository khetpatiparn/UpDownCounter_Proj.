library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity UpDownCounter2 is
	port (
		clk    : in std_logic;
		clear  : in std_logic;
		updown : in std_logic;
		q : out std_logic_vector(2 downto 0));
end entity;

architecture rtl of UpDownCounter2 is
	signal D : std_logic_vector(2 downto 0);
	signal qs : std_logic_vector(2 downto 0);
	signal ud : std_logic := '0';
begin
	D(2) <= (not ud and qs(2) and not qs(1)) or (qs(2) and qs(1) and not qs(0)) or (ud and qs(2) and qs(0))
			or (not ud and not qs(2) and qs(1) and qs(0)) or (ud and not qs(2) and not qs(1) and not qs(0));
	D(1) <= (not ud and not qs(1) and qs(0)) or (not ud and qs(1) and not qs(0)) or (ud and not qs(1) and not qs(0))
			or (ud and qs(1) and qs(0));
	D(0) <= not qs(0);
	
	process (clk) is
	begin
		
		if rising_edge(clk) then
			if clear = '1' then
				qs <= "000";

			elsif clear = '0' then 
			--count up--
				if updown = '0' then
					ud <= '0';
					qs <= D;
				
			--count down--
				elsif updown = '1' then
					ud <= '1';
					qs <= D;
				end if;
			end if;
		end if;		
	end process;
		q <= qs;
end architecture;

