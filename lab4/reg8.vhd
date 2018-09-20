LIBRARY ieee;         
USE ieee.std_logic_1164.ALL;

entity reg8 is
 port(  D: in  std_logic_vector(7 downto 0);
        Q: out std_logic_vector(7 downto 0);
   		LE: in  std_logic;	-- active high load enable
       MR: in  std_logic;	-- active high asynchronous reset
      clk: in std_logic);	-- rising edge-triggered
end reg8;

architecture synthesis of reg8 is

  signal state: std_logic_vector(7 downto 0);

 begin

   process (clk, MR)
    begin
	 if MR = '0' then
		state <= "00000000";
	 elsif clk'event and clk = '1' then
        if LE = '1' then
        	state <= D;
      	end if;
     end if;
   end process;

 Q <= state;

end synthesis;
