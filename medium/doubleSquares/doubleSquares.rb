#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/33/
# Programmed by: Carlos Montilla

include Math

def isInt? n
  delta = 1e-5
  return ((n - n.round).abs < delta) ? true : false 
end

def findDoubleSquares n
  max = Math.sqrt(n).floor
  count = 0
  (0..max).each do |i|
    left = n - (i * i)
    if isInt?(Math.sqrt(left)) then count += 1 end
  end
  
  return count / 2
end


count = 0
File.open(ARGV[0], "r").each_line do |line|
  if count == 0 then count += 1 
  else
    n = line.to_i
    sol = findDoubleSquares(line.to_i)
    puts sol
  end
end
