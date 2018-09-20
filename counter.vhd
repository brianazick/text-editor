library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
   port( clk: in std_logic;
		 reset: in std_logic;
		 backspace: in std_logic;
		 enter: in std_logic;
		 col_count_out : out std_logic_vector(5 downto 0);
		 row_count_out : out std_logic_vector(5 downto 0));
end counter;
 
architecture impl of counter is
   signal col_count : std_logic_vector(5 downto 0);
   signal row_count : std_logic_vector(5 downto 0);
begin 
   process(clk,reset) begin
      if reset='0' then
         col_count <= "000000"; row_count <= "000000";
      elsif(clk'event and clk = '1') then
         if col_count = "100111" and row_count = "011101" then
			col_count <= "000000"; row_count <= "000000";
         elsif col_count = "100111" then
			row_count <= row_count + '1'; col_count <= "000000";
		 elsif backspace = '1' then
			col_count <= col_count - '1';
		 elsif enter = '1' then
			row_count <= row_count + '1'; col_count <= "000000";
		 else
			col_count <= col_count + '1';
         end if;
      end if;
   end process;
   col_count_out <= col_count;
   row_count_out <= row_count;
end impl;