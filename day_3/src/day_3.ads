--  https://adventofcode.com/2023/
--  with Ada.Containers.Vectors;
--  with Ada.Strings.Text_Buffers;

package Day_3 is
   pragma Elaborate_Body;

   Max_Engine_Size    : constant := 150; -- big enogh to contain the whole dataset.
   Engine_Schematic   : array (1 .. Max_Engine_Size) of String (1 .. Max_Engine_Size) := [others => [others => ASCII.NUL]];
   Actual_Engine_Size : Natural;
   procedure Find_All_Numbers (Cb : not null access procedure (Line, Col : Natural; Num : String));
   function Is_Part_Number (Line, Col : Natural; Num : String) return Boolean;
end Day_3;
