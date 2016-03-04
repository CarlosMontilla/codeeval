#! /usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/183/
# Programmed by: Carlos Montilla

def findMin line
  min = Float::INFINITY
  points = 0
  status = 0
  line.split("").each do |c|
    if c == "." 
      points += 1
    elsif c == "X"
      status = 0
      points = 0
    else
      return points
    end
  end
end

File.open(ARGV[0], "r").read.split("\n").each do |line|

  rows = line.split(",")
  min = Float::INFINITY

  rows.each do |r|
    n = findMin r
    if n < min then min = n end
  end
  puts min
end

