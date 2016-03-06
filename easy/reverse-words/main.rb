#!/usr/bin/env ruby
filename = ARGV[0]


file = File.open(filename, "r")
data = file.read
file.close
lines = data.split("\n")
lines.each {|str| if not str == "" then  puts str.split.reverse.join(" ") end}
