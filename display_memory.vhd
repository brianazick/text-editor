library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity display_memory is 
	port( read_data : out std_logic_vector(5 downto 0);
		  memwrite, clock : in std_logic;
		  write_data : in std_logic_vector(5 downto 0);
		  --write_address : in std_logic_vector(11 downto 0);
		  --read_address : in std_logic_vector(11 downto 0)
		  pixel_col_write : in std_logic_vector(5 downto 0);
		  pixel_row_write : in std_logic_vector(5 downto 0);
		  pixel_col_read : in std_logic_vector(5 downto 0);
		  pixel_row_read : in std_logic_vector(5 downto 0);
		  reset : in std_logic);
end display_memory;

architecture impl of display_memory is
	type memory_type is array (29 downto 0, 39 downto 0) of std_logic_vector (5 downto 0);
	signal memory : memory_type := ((others=> (others=>o"40")));
	
	begin
		
		read_data <= memory(conv_integer(unsigned(pixel_row_read)), conv_integer(unsigned(pixel_col_read)));
		
		process (clock, reset, memwrite, pixel_row_write, pixel_col_write) begin
			if reset = '0' then
				memory <= ((others=> (others=>o"40")));
			elsif clock'event and clock = '1' and memwrite = '1' and reset = '1' then
				memory(conv_integer(unsigned(pixel_row_write)), conv_integer(unsigned(pixel_col_write))) <= write_data;
			end if;
		end process;
end impl;