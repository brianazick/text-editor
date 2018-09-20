library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity char_pos_to_display_memory_addr is 
	port( char_row : in std_logic_vector (5 downto 0);
		  char_col : in std_logic_vector (6 downto 0);
		  address : buffer std_logic_vector (11 downto 0));
end char_pos_to_display_memory_addr;

architecture impl of char_pos_to_display_memory_addr is
	constant screen_height : std_logic_vector(5 downto 0) := "101000";
	--signal addr_temp : std_logic_vector (11 downto 0); 
	begin
		process(char_row, char_col) begin
			--if char_row > x"27" then -- 29, max col index and 39, max row index are max valid values for chars char_col > x"1D" or 
				address <= char_row*screen_height + char_col;
				--address <= addr_temp (11 downto 1);
			--else address <= address;
			--end if;
		end process;
end impl;