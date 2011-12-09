-- qsys_led_master_0.vhd

-- This file was auto-generated from altera_jtag_avalon_master_hw.tcl.  If you edit it your changes
-- will probably be lost.
-- 
-- Generated using ACDS version 11.1 173 at 2011.12.10.02:22:52

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity qsys_led_master_0 is
	generic (
		USE_PLI     : integer := 0;
		PLI_PORT    : integer := 50000;
		FIFO_DEPTHS : integer := 2
	);
	port (
		clk_clk              : in  std_logic                     := '0';             --          clk.clk
		clk_reset_reset      : in  std_logic                     := '0';             --    clk_reset.reset
		master_address       : out std_logic_vector(31 downto 0);                    --       master.address
		master_readdata      : in  std_logic_vector(31 downto 0) := (others => '0'); --             .readdata
		master_read          : out std_logic;                                        --             .read
		master_write         : out std_logic;                                        --             .write
		master_writedata     : out std_logic_vector(31 downto 0);                    --             .writedata
		master_waitrequest   : in  std_logic                     := '0';             --             .waitrequest
		master_readdatavalid : in  std_logic                     := '0';             --             .readdatavalid
		master_byteenable    : out std_logic_vector(3 downto 0);                     --             .byteenable
		master_reset_reset   : out std_logic                                         -- master_reset.reset
	);
end entity qsys_led_master_0;

architecture rtl of qsys_led_master_0 is
	component qsys_led_master_0_jtag_phy_embedded_in_jtag_master is
		port (
			clk          : in  std_logic                    := 'X';             -- clk
			reset_n      : in  std_logic                    := 'X';             -- reset_n
			source_data  : out std_logic_vector(7 downto 0);                    -- data
			source_valid : out std_logic;                                       -- valid
			sink_data    : in  std_logic_vector(7 downto 0) := (others => 'X'); -- data
			sink_valid   : in  std_logic                    := 'X';             -- valid
			sink_ready   : out std_logic;                                       -- ready
			resetrequest : out std_logic                                        -- reset
		);
	end component qsys_led_master_0_jtag_phy_embedded_in_jtag_master;

	component qsys_led_master_0_timing_adt is
		port (
			clk       : in  std_logic                    := 'X';             -- clk
			reset_n   : in  std_logic                    := 'X';             -- reset_n
			in_valid  : in  std_logic                    := 'X';             -- valid
			in_data   : in  std_logic_vector(7 downto 0) := (others => 'X'); -- data
			out_valid : out std_logic;                                       -- valid
			out_data  : out std_logic_vector(7 downto 0);                    -- data
			out_ready : in  std_logic                    := 'X'              -- ready
		);
	end component qsys_led_master_0_timing_adt;

	component qsys_led_master_0_fifo is
		port (
			clk       : in  std_logic                    := 'X';             -- clk
			reset     : in  std_logic                    := 'X';             -- reset
			in_data   : in  std_logic_vector(7 downto 0) := (others => 'X'); -- data
			in_valid  : in  std_logic                    := 'X';             -- valid
			in_ready  : out std_logic;                                       -- ready
			out_data  : out std_logic_vector(7 downto 0);                    -- data
			out_valid : out std_logic;                                       -- valid
			out_ready : in  std_logic                    := 'X'              -- ready
		);
	end component qsys_led_master_0_fifo;

	component qsys_led_master_0_b2p is
		port (
			clk               : in  std_logic                    := 'X';             -- clk
			reset_n           : in  std_logic                    := 'X';             -- reset_n
			out_channel       : out std_logic_vector(7 downto 0);                    -- channel
			out_ready         : in  std_logic                    := 'X';             -- ready
			out_valid         : out std_logic;                                       -- valid
			out_data          : out std_logic_vector(7 downto 0);                    -- data
			out_startofpacket : out std_logic;                                       -- startofpacket
			out_endofpacket   : out std_logic;                                       -- endofpacket
			in_ready          : out std_logic;                                       -- ready
			in_valid          : in  std_logic                    := 'X';             -- valid
			in_data           : in  std_logic_vector(7 downto 0) := (others => 'X')  -- data
		);
	end component qsys_led_master_0_b2p;

	component qsys_led_master_0_p2b is
		port (
			clk              : in  std_logic                    := 'X';             -- clk
			reset_n          : in  std_logic                    := 'X';             -- reset_n
			in_ready         : out std_logic;                                       -- ready
			in_valid         : in  std_logic                    := 'X';             -- valid
			in_data          : in  std_logic_vector(7 downto 0) := (others => 'X'); -- data
			in_channel       : in  std_logic_vector(7 downto 0) := (others => 'X'); -- channel
			in_startofpacket : in  std_logic                    := 'X';             -- startofpacket
			in_endofpacket   : in  std_logic                    := 'X';             -- endofpacket
			out_ready        : in  std_logic                    := 'X';             -- ready
			out_valid        : out std_logic;                                       -- valid
			out_data         : out std_logic_vector(7 downto 0)                     -- data
		);
	end component qsys_led_master_0_p2b;

	component qsys_led_master_0_transacto is
		port (
			clk               : in  std_logic                     := 'X';             -- clk
			reset_n           : in  std_logic                     := 'X';             -- reset_n
			out_ready         : in  std_logic                     := 'X';             -- ready
			out_valid         : out std_logic;                                        -- valid
			out_data          : out std_logic_vector(7 downto 0);                     -- data
			out_startofpacket : out std_logic;                                        -- startofpacket
			out_endofpacket   : out std_logic;                                        -- endofpacket
			in_ready          : out std_logic;                                        -- ready
			in_valid          : in  std_logic                     := 'X';             -- valid
			in_data           : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			in_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			in_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			address           : out std_logic_vector(31 downto 0);                    -- address
			readdata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			read              : out std_logic;                                        -- read
			write             : out std_logic;                                        -- write
			writedata         : out std_logic_vector(31 downto 0);                    -- writedata
			waitrequest       : in  std_logic                     := 'X';             -- waitrequest
			readdatavalid     : in  std_logic                     := 'X';             -- readdatavalid
			byteenable        : out std_logic_vector(3 downto 0)                      -- byteenable
		);
	end component qsys_led_master_0_transacto;

	component qsys_led_master_0_b2p_adapter is
		port (
			clk               : in  std_logic                    := 'X';             -- clk
			reset_n           : in  std_logic                    := 'X';             -- reset_n
			in_ready          : out std_logic;                                       -- ready
			in_valid          : in  std_logic                    := 'X';             -- valid
			in_data           : in  std_logic_vector(7 downto 0) := (others => 'X'); -- data
			in_channel        : in  std_logic_vector(7 downto 0) := (others => 'X'); -- channel
			in_startofpacket  : in  std_logic                    := 'X';             -- startofpacket
			in_endofpacket    : in  std_logic                    := 'X';             -- endofpacket
			out_ready         : in  std_logic                    := 'X';             -- ready
			out_valid         : out std_logic;                                       -- valid
			out_data          : out std_logic_vector(7 downto 0);                    -- data
			out_startofpacket : out std_logic;                                       -- startofpacket
			out_endofpacket   : out std_logic                                        -- endofpacket
		);
	end component qsys_led_master_0_b2p_adapter;

	component qsys_led_master_0_p2b_adapter is
		port (
			clk               : in  std_logic                    := 'X';             -- clk
			reset_n           : in  std_logic                    := 'X';             -- reset_n
			in_ready          : out std_logic;                                       -- ready
			in_valid          : in  std_logic                    := 'X';             -- valid
			in_data           : in  std_logic_vector(7 downto 0) := (others => 'X'); -- data
			in_startofpacket  : in  std_logic                    := 'X';             -- startofpacket
			in_endofpacket    : in  std_logic                    := 'X';             -- endofpacket
			out_ready         : in  std_logic                    := 'X';             -- ready
			out_valid         : out std_logic;                                       -- valid
			out_data          : out std_logic_vector(7 downto 0);                    -- data
			out_startofpacket : out std_logic;                                       -- startofpacket
			out_endofpacket   : out std_logic;                                       -- endofpacket
			out_channel       : out std_logic_vector(7 downto 0)                     -- channel
		);
	end component qsys_led_master_0_p2b_adapter;

	signal jtag_phy_embedded_in_jtag_master_src_valid : std_logic;                    -- jtag_phy_embedded_in_jtag_master:source_valid -> timing_adt:in_valid
	signal jtag_phy_embedded_in_jtag_master_src_data  : std_logic_vector(7 downto 0); -- jtag_phy_embedded_in_jtag_master:source_data -> timing_adt:in_data
	signal timing_adt_out_valid                       : std_logic;                    -- timing_adt:out_valid -> fifo:in_valid
	signal timing_adt_out_data                        : std_logic_vector(7 downto 0); -- timing_adt:out_data -> fifo:in_data
	signal timing_adt_out_ready                       : std_logic;                    -- fifo:in_ready -> timing_adt:out_ready
	signal fifo_out_valid                             : std_logic;                    -- fifo:out_valid -> b2p:in_valid
	signal fifo_out_data                              : std_logic_vector(7 downto 0); -- fifo:out_data -> b2p:in_data
	signal fifo_out_ready                             : std_logic;                    -- b2p:in_ready -> fifo:out_ready
	signal b2p_out_packets_stream_endofpacket         : std_logic;                    -- b2p:out_endofpacket -> b2p_adapter:in_endofpacket
	signal b2p_out_packets_stream_valid               : std_logic;                    -- b2p:out_valid -> b2p_adapter:in_valid
	signal b2p_out_packets_stream_startofpacket       : std_logic;                    -- b2p:out_startofpacket -> b2p_adapter:in_startofpacket
	signal b2p_out_packets_stream_data                : std_logic_vector(7 downto 0); -- b2p:out_data -> b2p_adapter:in_data
	signal b2p_out_packets_stream_ready               : std_logic;                    -- b2p_adapter:in_ready -> b2p:out_ready
	signal b2p_out_packets_stream_channel             : std_logic_vector(7 downto 0); -- b2p:out_channel -> b2p_adapter:in_channel
	signal b2p_adapter_out_endofpacket                : std_logic;                    -- b2p_adapter:out_endofpacket -> transacto:in_endofpacket
	signal b2p_adapter_out_valid                      : std_logic;                    -- b2p_adapter:out_valid -> transacto:in_valid
	signal b2p_adapter_out_startofpacket              : std_logic;                    -- b2p_adapter:out_startofpacket -> transacto:in_startofpacket
	signal b2p_adapter_out_data                       : std_logic_vector(7 downto 0); -- b2p_adapter:out_data -> transacto:in_data
	signal b2p_adapter_out_ready                      : std_logic;                    -- transacto:in_ready -> b2p_adapter:out_ready
	signal transacto_out_stream_endofpacket           : std_logic;                    -- transacto:out_endofpacket -> p2b_adapter:in_endofpacket
	signal transacto_out_stream_valid                 : std_logic;                    -- transacto:out_valid -> p2b_adapter:in_valid
	signal transacto_out_stream_startofpacket         : std_logic;                    -- transacto:out_startofpacket -> p2b_adapter:in_startofpacket
	signal transacto_out_stream_data                  : std_logic_vector(7 downto 0); -- transacto:out_data -> p2b_adapter:in_data
	signal transacto_out_stream_ready                 : std_logic;                    -- p2b_adapter:in_ready -> transacto:out_ready
	signal p2b_adapter_out_endofpacket                : std_logic;                    -- p2b_adapter:out_endofpacket -> p2b:in_endofpacket
	signal p2b_adapter_out_valid                      : std_logic;                    -- p2b_adapter:out_valid -> p2b:in_valid
	signal p2b_adapter_out_startofpacket              : std_logic;                    -- p2b_adapter:out_startofpacket -> p2b:in_startofpacket
	signal p2b_adapter_out_data                       : std_logic_vector(7 downto 0); -- p2b_adapter:out_data -> p2b:in_data
	signal p2b_adapter_out_channel                    : std_logic_vector(7 downto 0); -- p2b_adapter:out_channel -> p2b:in_channel
	signal p2b_adapter_out_ready                      : std_logic;                    -- p2b:in_ready -> p2b_adapter:out_ready
	signal p2b_out_bytes_stream_valid                 : std_logic;                    -- p2b:out_valid -> jtag_phy_embedded_in_jtag_master:sink_valid
	signal p2b_out_bytes_stream_data                  : std_logic_vector(7 downto 0); -- p2b:out_data -> jtag_phy_embedded_in_jtag_master:sink_data
	signal p2b_out_bytes_stream_ready                 : std_logic;                    -- jtag_phy_embedded_in_jtag_master:sink_ready -> p2b:out_ready
	signal clk_reset_reset_ports_inv                  : std_logic;                    -- clk_reset_reset:inv -> [b2p:reset_n, b2p_adapter:reset_n, jtag_phy_embedded_in_jtag_master:reset_n, p2b:reset_n, p2b_adapter:reset_n, timing_adt:reset_n, transacto:reset_n]

begin

	use_pli_check : if USE_PLI /= 0 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	pli_port_check : if PLI_PORT /= 50000 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	fifo_depths_check : if FIFO_DEPTHS /= 2 generate
		assert false report "Supplied generics do not match expected generics" severity Failure;
	end generate;

	jtag_phy_embedded_in_jtag_master : component qsys_led_master_0_jtag_phy_embedded_in_jtag_master
		port map (
			clk          => clk_clk,                                    --        clock.clk
			reset_n      => clk_reset_reset_ports_inv,                  --  clock_reset.reset_n
			source_data  => jtag_phy_embedded_in_jtag_master_src_data,  --          src.data
			source_valid => jtag_phy_embedded_in_jtag_master_src_valid, --             .valid
			sink_data    => p2b_out_bytes_stream_data,                  --         sink.data
			sink_valid   => p2b_out_bytes_stream_valid,                 --             .valid
			sink_ready   => p2b_out_bytes_stream_ready,                 --             .ready
			resetrequest => master_reset_reset                          -- resetrequest.reset
		);

	timing_adt : component qsys_led_master_0_timing_adt
		port map (
			clk       => clk_clk,                                    --   clk.clk
			reset_n   => clk_reset_reset_ports_inv,                  -- reset.reset_n
			in_valid  => jtag_phy_embedded_in_jtag_master_src_valid, --    in.valid
			in_data   => jtag_phy_embedded_in_jtag_master_src_data,  --      .data
			out_valid => timing_adt_out_valid,                       --   out.valid
			out_data  => timing_adt_out_data,                        --      .data
			out_ready => timing_adt_out_ready                        --      .ready
		);

	fifo : component qsys_led_master_0_fifo
		port map (
			clk       => clk_clk,              --       clk.clk
			reset     => clk_reset_reset,      -- clk_reset.reset
			in_data   => timing_adt_out_data,  --        in.data
			in_valid  => timing_adt_out_valid, --          .valid
			in_ready  => timing_adt_out_ready, --          .ready
			out_data  => fifo_out_data,        --       out.data
			out_valid => fifo_out_valid,       --          .valid
			out_ready => fifo_out_ready        --          .ready
		);

	b2p : component qsys_led_master_0_b2p
		port map (
			clk               => clk_clk,                              --                clk.clk
			reset_n           => clk_reset_reset_ports_inv,            --          clk_reset.reset_n
			out_channel       => b2p_out_packets_stream_channel,       -- out_packets_stream.channel
			out_ready         => b2p_out_packets_stream_ready,         --                   .ready
			out_valid         => b2p_out_packets_stream_valid,         --                   .valid
			out_data          => b2p_out_packets_stream_data,          --                   .data
			out_startofpacket => b2p_out_packets_stream_startofpacket, --                   .startofpacket
			out_endofpacket   => b2p_out_packets_stream_endofpacket,   --                   .endofpacket
			in_ready          => fifo_out_ready,                       --    in_bytes_stream.ready
			in_valid          => fifo_out_valid,                       --                   .valid
			in_data           => fifo_out_data                         --                   .data
		);

	p2b : component qsys_led_master_0_p2b
		port map (
			clk              => clk_clk,                       --               clk.clk
			reset_n          => clk_reset_reset_ports_inv,     --         clk_reset.reset_n
			in_ready         => p2b_adapter_out_ready,         -- in_packets_stream.ready
			in_valid         => p2b_adapter_out_valid,         --                  .valid
			in_data          => p2b_adapter_out_data,          --                  .data
			in_channel       => p2b_adapter_out_channel,       --                  .channel
			in_startofpacket => p2b_adapter_out_startofpacket, --                  .startofpacket
			in_endofpacket   => p2b_adapter_out_endofpacket,   --                  .endofpacket
			out_ready        => p2b_out_bytes_stream_ready,    --  out_bytes_stream.ready
			out_valid        => p2b_out_bytes_stream_valid,    --                  .valid
			out_data         => p2b_out_bytes_stream_data      --                  .data
		);

	transacto : component qsys_led_master_0_transacto
		port map (
			clk               => clk_clk,                            --           clk.clk
			reset_n           => clk_reset_reset_ports_inv,          --     clk_reset.reset_n
			out_ready         => transacto_out_stream_ready,         --    out_stream.ready
			out_valid         => transacto_out_stream_valid,         --              .valid
			out_data          => transacto_out_stream_data,          --              .data
			out_startofpacket => transacto_out_stream_startofpacket, --              .startofpacket
			out_endofpacket   => transacto_out_stream_endofpacket,   --              .endofpacket
			in_ready          => b2p_adapter_out_ready,              --     in_stream.ready
			in_valid          => b2p_adapter_out_valid,              --              .valid
			in_data           => b2p_adapter_out_data,               --              .data
			in_startofpacket  => b2p_adapter_out_startofpacket,      --              .startofpacket
			in_endofpacket    => b2p_adapter_out_endofpacket,        --              .endofpacket
			address           => master_address,                     -- avalon_master.address
			readdata          => master_readdata,                    --              .readdata
			read              => master_read,                        --              .read
			write             => master_write,                       --              .write
			writedata         => master_writedata,                   --              .writedata
			waitrequest       => master_waitrequest,                 --              .waitrequest
			readdatavalid     => master_readdatavalid,               --              .readdatavalid
			byteenable        => master_byteenable                   --              .byteenable
		);

	b2p_adapter : component qsys_led_master_0_b2p_adapter
		port map (
			clk               => clk_clk,                              --   clk.clk
			reset_n           => clk_reset_reset_ports_inv,            -- reset.reset_n
			in_ready          => b2p_out_packets_stream_ready,         --    in.ready
			in_valid          => b2p_out_packets_stream_valid,         --      .valid
			in_data           => b2p_out_packets_stream_data,          --      .data
			in_channel        => b2p_out_packets_stream_channel,       --      .channel
			in_startofpacket  => b2p_out_packets_stream_startofpacket, --      .startofpacket
			in_endofpacket    => b2p_out_packets_stream_endofpacket,   --      .endofpacket
			out_ready         => b2p_adapter_out_ready,                --   out.ready
			out_valid         => b2p_adapter_out_valid,                --      .valid
			out_data          => b2p_adapter_out_data,                 --      .data
			out_startofpacket => b2p_adapter_out_startofpacket,        --      .startofpacket
			out_endofpacket   => b2p_adapter_out_endofpacket           --      .endofpacket
		);

	p2b_adapter : component qsys_led_master_0_p2b_adapter
		port map (
			clk               => clk_clk,                            --   clk.clk
			reset_n           => clk_reset_reset_ports_inv,          -- reset.reset_n
			in_ready          => transacto_out_stream_ready,         --    in.ready
			in_valid          => transacto_out_stream_valid,         --      .valid
			in_data           => transacto_out_stream_data,          --      .data
			in_startofpacket  => transacto_out_stream_startofpacket, --      .startofpacket
			in_endofpacket    => transacto_out_stream_endofpacket,   --      .endofpacket
			out_ready         => p2b_adapter_out_ready,              --   out.ready
			out_valid         => p2b_adapter_out_valid,              --      .valid
			out_data          => p2b_adapter_out_data,               --      .data
			out_startofpacket => p2b_adapter_out_startofpacket,      --      .startofpacket
			out_endofpacket   => p2b_adapter_out_endofpacket,        --      .endofpacket
			out_channel       => p2b_adapter_out_channel             --      .channel
		);

	clk_reset_reset_ports_inv <= not clk_reset_reset;

end architecture rtl; -- of qsys_led_master_0
