library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity char_pos_to_display_memory_addr is 
	port( char_row : in std_logic_vector (5 downto 0);
		  char_col : in std_logic_vector (6 downto 0);
		  address : out std_logic_vector (13 downto 0));
end char_pos_to_display_memory_addr;

architecture impl of char_pos_to_display_memory_addr is
	signal screen_height: std_logic_vector (5 downto 0);
	begin
		screen_height <= "111100";
		
		
		
end impl;