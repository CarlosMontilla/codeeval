#!/usr/bin/ruby
#
# Counts the numbers of ones in a binary representation of a number

File.open(ARGV[0]).each_line do |line|
  puts line.delete("\n").to_i.to_s(2).split("").map{|c| c.to_i}.inject(:+)
end
