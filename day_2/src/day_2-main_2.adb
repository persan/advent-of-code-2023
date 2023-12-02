with Ada.Text_IO; use Ada.Text_IO;
procedure Day_2.Main_2 is
   F     : Ada.Text_IO.File_Type;

   Value  : Integer := 0;
   G      : Game;
begin
   F.Open (Ada.Text_IO.In_File, "input");
   while not F.End_Of_File loop
      G := Day_2.Value (F.Get_Line);
      Value := @ + G.Min_Bag.Power;
   end loop;
   Ada.Text_IO.Put_Line (Value'Img);
end Day_2.Main_2;
