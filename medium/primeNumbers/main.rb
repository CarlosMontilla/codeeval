#!/usr/bin/ruby
# Prints out the prime numbers less than n

require 'prime'

File.open(ARGV[0],"r").read.split("\n").each do |str|
  bound = str.to_i
  sol = Prime.take_while {|p| p < bound}
  puts sol.join(",")
end
