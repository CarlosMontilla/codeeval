#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/203/
# Programmed by: Carlos Montilla

def findMatch str, subStr
  n = 0
  (0..(str.length - subStr.length)).each do |i|
    if subStr == str[i, subStr.length] then n += 1 end
  end
  return n
end

a1 = ">>-->"
a2 = "<--<<"

File.open(ARGV[0], "r").read.split("\n").each do |line|
  n1 = findMatch line, a1
  n2 = findMatch line, a2
  puts n1 + n2
end
