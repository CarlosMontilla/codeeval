#!/usr/bin/env ruby

# Solves the codeeval challenge https://www.codeeval.com/open_challenges/199/
# Programmed by: Carlos Montilla

def applyMask(str, mask)
  newStr = ""
  (0...(str.length)).each do |i|
    if mask[i] == "1" 
      newStr += str[i].upcase
    else
      newStr += str[i]
    end
  end
  return newStr
end

File.open(ARGV[0], "r").read.split("\n").each do |line|
  data = line.split(" ")
  puts applyMask(data[0], data[1])
end
    
