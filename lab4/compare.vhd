LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY COMPARE IS
	PORT(
		MAKE_CODE, BREAK_CODE		: IN	STD_LOGIC_VECTOR(7 downto 0);
		error	: OUT	STD_LOGIC);
END COMPARE;

ARCHITECTURE synthesis of COMPARE is
BEGIN
PROCESS(MAKE_CODE, BREAK_CODE)
BEGIN
if MAKE_CODE = BREAK_CODE then
	error <= '0';
else
	error <= '1';
end if;
END PROCESS;
END synthesis;
