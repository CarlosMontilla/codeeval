#!usr/bin/env ruby

# Solves the minimum distance problem of codeeval
# https://www.codeeval.com/open_challenges/189/
# programmed by: Carlos Montilla

def median lst
  lst.sort!
  if (lst.size % 2 == 0)
    index = (lst.size) / 2
    return (lst[index - 1] + lst[index]) / 2
  else
    index = (lst.size + 1) / 2;
    return lst[index - 1]
  end
end

def findMinimumDistance lst
  mean = median lst
  sum = 0
  lst.each do |i|
    sum = sum + (i - mean).abs
  end
  return sum
end


File.open(ARGV[0], "r").read.split("\n").each do |line|
  lst = line.split(" ").map {|i| i.to_i}
  puts findMinimumDistance lst[(1..(lst.size))]
end
