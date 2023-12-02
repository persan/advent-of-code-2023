
with Ada.Text_IO; use Ada.Text_IO;
procedure @_project_@.Main_1 is
   F     : Ada.Text_IO.File_Type;

begin
   F.Open (Ada.Text_IO.In_File, "input");
   --   while not F.End_Of_File loop

   -- end loop;
   -- Ada.Text_IO.Put_Line (Value'Img);
   F.Close;
end @_project_@.Main_1;
