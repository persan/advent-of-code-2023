--  --- Part Two ---
--
--  Your calculation isn't quite right.
--  It looks like some of the digits are actually spelled out with letters:
--  one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".
--
--  Equipped with this new information, you now need to find the real first
--  and last digit on each line. For example:
--
--  two1nine
--  eightwothree
--  abcone2threexyz
--  xtwone3four
--  4nineeightseven2
--  zoneight234
--  7pqrstsixteen
--
--  In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76.
--  Adding these together produces 281.
--
--  What is the sum of all of the calibration values?

with Ada.Text_IO;
with Ada.Containers.Indefinite_Ordered_Maps;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
procedure Day_1.Main_2 is
   F     : Ada.Text_IO.File_Type;
   package Smaps is new Ada.Containers.Indefinite_Ordered_Maps (Key_Type => String, Element_Type => Integer);

   Map   : constant Smaps.Map := ["zero" => 0, "0" => 0,
                                  "one" => 1, "1" => 1,
                                  "two" => 2, "2" => 2,
                                  "three" => 3, "3" => 3,
                                  "four" => 4, "4" => 4,
                                  "five" => 5, "5" => 5,
                                  "six" => 6, "6" => 6,
                                  "seven" => 7, "7" => 7,
                                  "eight" => 8, "8" => 8,
                                  "nine" => 9, "9" => 9];


   function  Parse (Item : String) return Integer is
      First : Integer := -1;
      Last  : Integer := -1;
   begin
      for Ix in Item'Range loop
         declare
            procedure Process (Position : Smaps.Cursor) is
            begin
               if Index (Item (Ix .. Item'Last), Position.Key) = Ix then
                  Last := Map (Position.Key);
                  if First = -1 then
                     First := Map (Position.Key) * 10;
                  end if;
               end if;
            end;
         begin
            Map.Iterate (Process'Access);
         end;
      end loop;
      return First + Last;
   end Parse;

   Value   : Integer := 0;
begin
   F.Open (Ada.Text_IO.In_File, "input");
   while not F.End_Of_File loop
      Value := @  +Parse (F.Get_Line);
   end loop;
   Ada.Text_IO.Put_Line (Value'Img);
end Day_1.Main_2;
