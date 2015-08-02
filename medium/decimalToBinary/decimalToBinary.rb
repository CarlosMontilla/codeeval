#!/usr/bin/ruby
# Prints out the binary representation of a decimal number

File.open(ARGV[0],'r').read.split("\n").each do |str|
  puts str.to_i.to_s(2)
end

