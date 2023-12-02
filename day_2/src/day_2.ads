--  https://adventofcode.com/2023/day/2
with Ada.Containers.Vectors;
with Ada.Strings.Text_Buffers;

package Day_2 is
   type Cube_Colour is (Blue, Red, Green);
   type Bag is array (Cube_Colour) of Integer with
     Default_Component_Value => 0 ,
     Put_Image => Put_Image;
   procedure Put_Image
     (S : in out Ada.Strings.Text_Buffers.Root_Buffer_Type'Class; V : Bag);
   function Value (S : String) return Bag;
   function Possible (Toss : Bag ; With_Bag : Bag) return Boolean;


   package Bag_Vectors is new Ada.Containers.Vectors (Natural, Bag);

   type Game is record
      Id     : Integer := 0;
      Tosses : Bag_Vectors.Vector;
   end record with
     Put_Image => Put_Image;

   procedure Put_Image
     (S : in out Ada.Strings.Text_Buffers.Root_Buffer_Type'Class; V : Game);

   function Value (S : String) return Game;
   function Possible (G : Game ; With_Bag : Bag) return Boolean;

   function Min_Bag (G : Game) return Bag;
   function Power (B : Bag) return Integer;

   Big_Bag    : constant Bag := [Blue => 14, Red => 12, Green => 13];

end Day_2;
