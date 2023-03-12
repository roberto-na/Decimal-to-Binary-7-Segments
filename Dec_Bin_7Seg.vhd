----------------------------------------------------------------------------------
-- Company: 		 ITESM - CQ
-- Engineer: 		 El 7 Segmentos
-- 
-- Create Date:    11:24:59 08/22/2018 
-- Design Name: 
-- Module Name:    Dec_Bin_7Seg - Dec_Seg_7Seg_Arch 
-- Project Name: 
-- Target Devices: Nexys-3 board
-- Tool versions:  Ise Webpack v 14.7
-- Description:    Binary to 7 segments
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--The following library will need to be declared for this function:
library IEEE;
use IEEE.std_logic_unsigned.all;

entity Dec_Bin_7Seg is
--4-bit binary input value
    Port ( D : in  STD_LOGIC;
           C : in  STD_LOGIC;
           B : in  STD_LOGIC;
           A : in  STD_LOGIC; 
			  --Selects the display where value will be shown
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
			  --Segments of the 7-segment display including point
           SegPunto : out  STD_LOGIC;
           SegG : out  STD_LOGIC;
           SegF : out  STD_LOGIC;
           SegE : out  STD_LOGIC;
           SegD : out  STD_LOGIC;
           SegC : out  STD_LOGIC;
           SegB : out  STD_LOGIC;
           SegA : out  STD_LOGIC;
			  -- Signal that turn the display on/off
           Disp : out  STD_LOGIC_VECTOR (3 downto 0));
end Dec_Bin_7Seg;

architecture Dec_Seg_7Seg_Arch of Dec_Bin_7Seg is
	--Embedded signal declaration
	signal Bin: STD_LOGIC_VECTOR(3 downto 0);
	signal Seg: STD_LOGIC_VECTOR(7 downto 0);
	--Integer representation of Bin
	signal BinInt: integer;
begin
	--Secuential case implementation of the 7 segment binary to
	--7-segment decoder
	--Concatenate D,C,B,A into a Bin
	
	Bin <= D & C & B & A;
	
	process (Bin)
	begin
		case (Bin) is           --.gfedcba
			when "0000" => Seg <= "11000000"; -- 0
			when "0001" => Seg <= "11111001"; -- 1
			when "0010" => Seg <= "10100100"; -- 2
			when "0011" => Seg <= "10110000"; -- 3
			when "0100" => Seg <= "10011001"; -- 4
			when "0101" => Seg <= "10010010"; -- 5
			when "0110" => Seg <= "10000010"; -- 6
			when "0111" => Seg <= "11111000"; -- 7
			when "1000" => Seg <= "10000000"; -- 8
			when "1001" => Seg <= "10010000"; -- 9
			when "1010" => Seg <= "10001000"; -- A
			when "1011" => Seg <= "10000011"; -- B
			when "1100" => Seg <= "11000110"; -- C
			when "1101" => Seg <= "10100001"; -- D 
			when "1110" => Seg <= "10000110"; -- E
			when "1111" => Seg <= "10001110"; -- F
			when others => Seg <= "11111111"; --Error (Point on)
		end case;
	end process;
	
	--Everything is in binary
--	Bin <= D & C & B & A;
--	with Bin select--.gfecdba
--      		Seg <= "11000000" when "0000",-- 0
--             	 "11111001"	when "0001",-- 1
--				 		 "10100100" when "0010",-- 2
--                 "10110000"	when "0011",-- 3
--				 		 "10011001" when "0100",-- 4
--                 "10010010"	when "0101",-- 5
--				 		 "10000010" when "0110",-- 6
--             	 "11111000"	when "0111",-- 7
--				 		 "10000000" when "1000",-- 8
--             	 "10010000"	when "1001",-- 9
--				 		 "10001000" when "1010",-- A
--             	 "10000011"	when "1011",-- B
--				 		 "11000110" when "1100",-- C
--             	 "10100001"	when "1101",-- D
--				 		 "10000110" when "1110",-- E
--             	 "10001110"	when "1111",-- F
--             	 "01111111" when others;
	
	--Left side in decimal
	--Conversion fron STD_LOGIC (Bin) to integer
--	Bin <= D & C & B & A;
--	BinInt <= CONV_INTEGER(Bin);
--	with BinInt select--.gfedcba
--					Seg <= "11000000" when 0, -- 0
--							 "11111001"	when 1, -- 1
--				          "10100100" when 2, -- 2
--							 "10110000"	when 3, -- 3
--							 "10011001" when 4, -- 4
--							 "10010010"	when 5, -- 5
--							 "10000010" when 6, -- 6
--							 "11111000"	when 7, -- 7
--							 "10000000" when 8, -- 8
--							 "10010000"	when 9, -- 9
--							 "10001000" when 10,-- A
--							 "10000011"	when 11,-- B
--							 "11000110" when 12,-- C
--							 "10100001"	when 13,-- D
--							 "10000110" when 14,-- E
--							 "10001110"	when 15,-- F
--							 "01111111" when others;

--	Bin <= D & C & B & A;
--	--BinInt <= CONV_INTEGER(Bin);
--	with Bin select
--					Seg <= X"C0" when 0, -- 0
--							 X"F9" when 1, -- 1
--				          X"A4" when 2, -- 2
--							 X"B0" when 3, -- 3
--							 X"99" when 4, -- 4
--							 X"92" when 5, -- 5
--							 X"82" when 6, -- 6
--							 X"F8" when 7, -- 7
--							 X"80" when 8, -- 8
--							 X"90" when 9, -- 9
--							 X"88" when 10,-- A
--							 X"83" when 11,-- B
--							 X"C6" when 12,-- C
--							 X"A1" when 13,-- D
--							 X"86" when 14,-- E
--							 X"8E" when 15,-- F
--							 X"7F" when others;
							 
	-- Deconcatenate Seg into it's respective output segments
	SegPunto <= Seg(7);
	SegG		<= Seg(6);
	SegF		<= Seg(5);
	SegE		<= Seg(4);
	SegD		<= Seg(3);
	SegC		<= Seg(2);
	SegB		<= Seg(1);
	SegA		<= Seg(0);

end Dec_Seg_7Seg_Arch;

