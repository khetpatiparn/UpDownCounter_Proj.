library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity UpDownCounter is
	port (
	    --inputs--
		clk    : in std_logic;
		clear  : in std_logic; --Negative input--
		updown : in std_logic; --up when 0 ,down when 1 --
		--output--
		q : out std_logic_vector(2 downto 0));
end entity;

architecture rtl of UpDownCounter is
	signal counter_updown : std_logic_vector(2 downto 0);
begin
	
	process (clk) is
	begin
	
		if rising_edge(clk) then
			if clear = '1' then
				counter_updown <= "000";
			--count up--
			elsif updown = '0' then
				counter_updown <= counter_updown + 1;
			--count down--
			else
				counter_updown <= counter_updown - 1;
			end if;
		end if;
		
	end process;
		q <= counter_updown;
end architecture;

