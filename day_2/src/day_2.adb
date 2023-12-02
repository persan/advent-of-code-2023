with GNAT.String_Split;
with GNAT.Regpat;
package body Day_2  is
   procedure Put_Image
     (S : in out Ada.Strings.Text_Buffers.Root_Buffer_Type'Class; V : Bag) is
      First : Boolean := True;
   begin
      for I in Bag'Range loop
         if V (I) > 0 then
            if not First then
               S.Put (",");
               First := False;
            end if;
            S.Put (V (I)'Img);
            S.Put (" " & I'Img);
         end if;
      end loop;
   end;

   procedure Put_Image
     (S : in out Ada.Strings.Text_Buffers.Root_Buffer_Type'Class; V : Game) is
      First : Boolean := True;
   begin
      S.Put ("Game" & V.Id'Image & ":");
      for I of V.Tosses loop
         if not First then
            S.Put (";");
            First := False;
         end if;
         S.Put (I'Img);
      end loop;
   end Put_Image;
   function Possible (Toss : Bag ; With_Bag : Bag) return Boolean is
   begin
      for I in Toss'Range loop
         if Toss (I) > With_Bag (I) then
            return False;
         end if;
      end loop;
      return True;
   end;

   function Value (S : String) return Bag  is
      use GNAT.Regpat;
      Matcher : constant GNAT.Regpat.Pattern_Matcher := Compile ("\s*(\d+)\s*(\S+)");
      Matches : GNAT.Regpat.Match_Array (1 .. Paren_Count (Matcher));
   begin
      return Ret : Bag do
         for Cubes of GNAT.String_Split.Create (S, ",") loop
            Matcher.Match (Cubes, Matches);
            Ret (Cube_Colour'Value (S (Matches (2).First .. Matches (2).Last))) :=
              Integer'Value (S (Matches (1).First .. Matches (1).Last));
         end loop;
      end return;
   end Value;

   function Value (S : String) return Game  is
      use GNAT.String_Split;
      Line : constant GNAT.String_Split.Slice_Set := Create
        (From       => S,
         Separators => ":", Mode => Multiple);
   begin
      return Ret : Game do
         Ret.Id := Integer'Value (GNAT.String_Split.Create (Line.Slice (1), " ", Multiple).Slice (2));
         for Toss of GNAT.String_Split.Create (Line.Slice (2), ";") loop
            Ret.Tosses.Append (Value (Toss));
         end loop;
      end return;
   end Value;

   function Possible (G : Game ; With_Bag : Bag) return Boolean is
   begin
      for I of G.Tosses loop
         if not I.Possible (With_Bag) then
            return False;
         end if;
      end loop;
      return True;
   end Possible;

   function Min_Bag (G : Game) return Bag is
   begin
      return Ret : Bag do
         for Toss of G.Tosses loop
            for Ix in Bag'Range loop
               if Ret (Ix) < Toss (Ix) then
                  Ret (Ix) := Toss (Ix);
               end if;
            end loop;
         end loop;
      end return;
   end Min_Bag;

   function Power (B : Bag) return Integer is

   begin
      return Ret : Integer := 1 do
         for I of B loop
            if I > 0 then
               Ret := Ret * I;
            end if;
         end loop;
      end return;
   end;
end Day_2;
