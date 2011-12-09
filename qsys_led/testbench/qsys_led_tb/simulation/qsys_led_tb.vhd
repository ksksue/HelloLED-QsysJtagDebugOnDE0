-- qsys_led_tb.vhd

-- Generated using ACDS version 11.1 173 at 2011.12.10.02:23:58

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity qsys_led_tb is
end entity qsys_led_tb;

architecture rtl of qsys_led_tb is
	component qsys_led is
		port (
			clk_clk : in std_logic := 'X'  -- clk
		);
	end component qsys_led;

	component altera_avalon_clock_source is
		generic (
			CLOCK_RATE : positive := 10
		);
		port (
			clk : out std_logic   -- clk
		);
	end component altera_avalon_clock_source;

	signal qsys_led_inst_clk_bfm_clk_clk : std_logic; -- qsys_led_inst_clk_bfm:clk -> qsys_led_inst:clk_clk

begin

	qsys_led_inst : component qsys_led
		port map (
			clk_clk => qsys_led_inst_clk_bfm_clk_clk  -- clk.clk
		);

	qsys_led_inst_clk_bfm : component altera_avalon_clock_source
		generic map (
			CLOCK_RATE => 50
		)
		port map (
			clk => qsys_led_inst_clk_bfm_clk_clk  -- clk.clk
		);

end architecture rtl; -- of qsys_led_tb