library ieee;
use ieee.std_logic_1164.all;

entity backspace_or_enter is
	port (scan_code: in std_logic_vector (7 downto 0);
		  backspace, enter: out std_logic);
end backspace_or_enter;

architecture impl of backspace_or_enter is
	begin
	process (scan_code) begin
		if scan_code = "01100110" then
			backspace <= '1'; enter <= '0';
		elsif scan_code = "01011010" then
			backspace <= '0'; enter <= '1';
		else backspace <= '0'; enter <= '0';
		end if;
	end process;
end impl;