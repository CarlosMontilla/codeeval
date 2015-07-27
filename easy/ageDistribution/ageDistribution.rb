#! /usr/bin/ruby

def printInfo n
  if (n>=0 and n<=2) then return "Still in Mama's arms"
  elsif (n <= 4) then return "Preschool Maniac"
  elsif (n <= 11) then return "Elementary school"
  elsif (n <= 14) then return "Middle school"
  elsif (n <= 18) then return "High school"
  elsif (n <= 22) then return "College"
  elsif (n <= 65) then return "Working for the man"
  elsif (n <= 100) then return "The Golden Years"
  else return "This program is for humans"
  end
end

File.open(ARGV[0],"r").read.split("\n").each {|i| puts printInfo(i.to_i)}

