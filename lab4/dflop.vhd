library ieee;
use ieee.std_logic_1164.all;

entity dflop is
        generic (k : integer := 8);
        port( clk : in std_logic;
              D   : in std_logic_vector(k-1 downto 0);
              reset : in std_logic;
              Q, Q_n  : out std_logic_vector(k-1 downto 0));
end dflop;


architecture impl of dflop is
signal qi  : std_logic_vector(k-1 downto 0);
begin
  process(reset, clk) begin
    if (reset = '0' ) then
      qi <= (others =>'0');
      
  elsif rising_edge(clk) then    
      qi<= D;
    end if;
  end process;
  
  Q <= qi;
  Q_n <= not qi;
end impl;