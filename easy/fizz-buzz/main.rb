#!/usr/bin/env ruby

# Emules the game fizz buzz

def fizzbuzz(n1, n2, to)
  (1..to).each do |i|
    flag = 0
    if i != 1 then print " " end
    if i % n1 == 0 then print "F"; flag = 1 end
    if i % n2 == 0 then print "B"; flag = 1 end
    if flag == 0 then print i end
  end
  puts ""
end

file = File.open(ARGV[0], 'r')
lines = file.read.split("\n")
lines.each do |str|
  numbers = str.split.map {|i| i.to_i}
  fizzbuzz(numbers[0], numbers[1], numbers[2])
end
