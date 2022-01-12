library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ascensor is
    Port ( Tiempo, SPY, PisoReqX, PisoReqY, clk: in  STD_LOGIC;
           PuertaAbierta, PuertaCerrada, PARO, AvancePiso : out  STD_LOGIC;
           Q2, Q1, Q0 : inout  STD_LOGIC);
end ascensor;

architecture asm of ascensor is
	type estados is (A, B, C, D, E, F);
	signal edo_pres, edo_fut: estados;
begin
	p_estados: process (edo_pres, Tiempo, SPY, PisoReqX, PisoReqY)
begin
case edo_pres is
when A => PuertaAbierta <= '0'; PuertaCerrada <= '1'; PARO <= '1'; AvancePiso <= '0' ; Q2 <= '0'; Q1 <= '0'; Q0 <= '0'; 
	if PisoReqX = '0' and PisoReqY = '0' then 
	edo_fut <= A; 
	end if;
	if PisoReqX = '1' then 															
	edo_fut <= B;
	end if;
	if PisoReqY = '1' then
	edo_fut <= D;
	end if;	
when B => PuertaAbierta <= '1'; PuertaCerrada <= '0'; PARO <= '1'; AvancePiso <= '0'; Q2 <= '0'; Q1 <= '0'; Q0 <= '1'; 															--estado uno
	if Tiempo = '1' then 															
	edo_fut <= C;
	else 
	edo_fut <= B;
	end if;
when C => PuertaAbierta <= '0'; PuertaCerrada <= '1'; PARO <= '1'; AvancePiso <= '0'; Q2 <= '0'; Q1 <= '1'; Q0 <= '0'; 	
	edo_fut <= D;
when D => PuertaAbierta <= '0'; PuertaCerrada <= '1'; PARO <= '0'; AvancePiso <= '1'; Q2 <= '0'; Q1 <= '1'; Q0 <= '1'; 
	if SPY = '1' then
	edo_fut <= E;
	else
	edo_fut <= D;
	end if;
when E => PuertaAbierta <= '0'; PuertaCerrada <= '1'; PARO <= '1'; AvancePiso <= '0'; Q2 <= '1'; Q1 <= '0'; Q0 <= '0'; 
	edo_fut <= F;
when F => PuertaAbierta <= '1'; PuertaCerrada <= '0'; PARO <= '1'; AvancePiso <= '0'; Q2 <= '1'; Q1 <= '0'; Q0 <= '1'; 
	if Tiempo = '1' then 															
	edo_fut <= A;
	else 
	edo_fut <= F;
	end if;
end case;
end process p_estados;

p_reloj: process (clk) begin
	if (clk'event and clk = '1') then 
			edo_pres <= edo_fut;
	end if;
end process;
end asm;


