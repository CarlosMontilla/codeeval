#!/usr/bin/ruby

def findDigits(str)
  alphabet = {"a" => 0,
              "b" => 1,
              "c" => 2,
              "d" => 3,
              "e" => 4,
              "f" => 5,
              "g" => 6,
              "h" => 7,
              "i" => 8,
              "j" => 9,
              "0" => 0,
              "1" => 1,
              "2" => 2,
              "3" => 3,
              "4" => 4,
              "5" => 5,
              "6" => 6,
              "7" => 7,
              "8" => 8,
              "9" => 9,}


  digits = "";
  str.split("").each {|c| if alphabet.has_key?(c) then digits += alphabet[c].to_s end}
  if digits.length > 0 then return digits else return "NONE" end
end

File.open(ARGV[0],"r").read.split("\n").each {|str| puts findDigits(str)}
