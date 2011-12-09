library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity qsys_led_top is
	port (
		clk : in std_logic;
		led : out std_logic_vector(9 downto 0)
	);
end entity qsys_led_top;

architecture rtl of qsys_led_top is

component qsys_led is
	port (
	clk_clk : in std_logic := 'X';  -- clk
	led_export : out std_logic_vector(31 downto 0)         -- export
	);
end component qsys_led;

signal led_reg : std_logic_vector(31 downto 0);

begin

	led <= led_reg(9 downto 0);
	
	u0 : component qsys_led
	port map (
		clk_clk => clk,
		led_export => led_reg
	);

end rtl;
