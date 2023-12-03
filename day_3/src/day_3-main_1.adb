
with Ada.Text_IO; use Ada.Text_IO;
procedure Day_3.Main_1 is
   F               : Ada.Text_IO.File_Type;
   Cursor          : Natural := 1;
   Part_Number_Sum : Integer := 0;

   procedure  Cb (Line, Col : Natural; Num : String) is
   begin
      if Is_Part_Number (Line, Col, Num) then
         --  Put_Line (Line'Img & Col'Img & " " & Num);
         Part_Number_Sum := @ + Integer'Value (Num);
      end if;
   end;
begin

   F.Open (Ada.Text_IO.In_File, "input");

   while not F.End_Of_File loop
      F.Get_Line (Engine_Schematic (Cursor), Actual_Engine_Size);
      Cursor := Cursor + 1;
   end loop;

   F.Close;
   Find_All_Numbers (Cb'Unrestricted_Access);
   Put_Line (Part_Number_Sum'Image);
end Day_3.Main_1;
