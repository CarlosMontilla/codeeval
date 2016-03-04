#!/usr/bin/ruby

data = File.open(ARGV[0], "r").read.split("\n")
n = data[0].to_i
strs = data[1..(data.length)].sort {|s1,s2| s1.length <=> s2.length}.reverse
puts strs[0,n]
