package body Day_3  is

   procedure Find_All_Numbers (Cb : not null access procedure (Line, Col : Natural; Num : String)) is
      Col       : Natural;
      Start     : Natural := 1;
      Line      : Natural := 1;
      In_Number : Boolean := False;
   begin
      while Line <= Actual_Engine_Size loop
         Col := 1;
         while Col <= Actual_Engine_Size loop
            if In_Number and then Engine_Schematic (Line) (Col) not in '0' .. '9'  then
               In_Number := False;
               Cb (Line, Start, Engine_Schematic (Line) (Start .. Col - 1));
            elsif In_Number and then  Col = Actual_Engine_Size then
               In_Number := False;
               Cb (Line, Start, Engine_Schematic (Line) (Start .. Col));
            elsif In_Number then
               null;
            elsif not In_Number and then Engine_Schematic (Line) (Col) in '0' .. '9' then
               In_Number := True;
               Start := Col;
            end if;
            Col := Col + 1;
         end loop;
         Line := Line + 1;
      end loop;
   end;

   function Contains_Symbol (Line, Col : Natural) return Boolean is
   begin
      if Line < 1 or else Col < 1 or else Line > Actual_Engine_Size or else Col > Actual_Engine_Size then
         return False;
      else
         return Engine_Schematic (Line)(Col) in '#' | '%' | '&' | '*' | '+' | '-' | '/' | '=' | '@' | '$';
      end if;
   end;

   function Is_Part_Number (Line, Col : Natural; Num : String) return Boolean  is
   begin
      for L in Line - 1 .. Line + 1 loop
         for C in Col - 1 .. Col + Num'Length loop
            return True when Contains_Symbol (L, C);
         end loop;
      end loop;
      return False;
   end;
end Day_3;
