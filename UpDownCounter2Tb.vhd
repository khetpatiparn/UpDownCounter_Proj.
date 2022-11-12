library ieee;
use ieee.std_logic_1164.all;

entity UpDownCounter2Tb is
end entity;

architecture sim of UpDownCounter2Tb is

	constant clkfrequency : integer := 100e6;
	constant clkpreriod : time := 1000 ms / clkfrequency;

	signal clear : std_logic;
	signal clk : std_logic := '1';
	signal updown : std_logic;
	signal q : std_logic_vector(2 downto 0);
	
begin

	clk <= not clk after clkpreriod /2 ;
	
	i_UpDownCounter : entity work.UpDownCounter2(rtl)
	port map(
		clk 	=> clk,
		clear 	=> clear,
		q 		=> q,
		updown => updown);
		
	process is
	begin
	
		clear <= '1';
		updown <= '0';
		wait for 30 ns;
		clear <= '0';
		wait for 125 ns;
		updown <= '1';
		wait for 150 ns;
		updown <= '0';
		wait;
		
	end process;
end architecture;
