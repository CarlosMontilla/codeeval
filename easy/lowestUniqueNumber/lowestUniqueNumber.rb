#!/usr/bin/ruby

def findLowestUnique lst
  dict = {}
  num_count = Array.new(9,0)
  lst.each {|i| num_count[i-1] += 1}
  (0...(num_count.length)).each {|i| if num_count[i] == 1 then return lst.index(i+1) + 1 end}
  return 0
end

File.open(ARGV[0]).read.split("\n").each do |line|
  puts findLowestUnique(line.split(" ").map {|i| i.to_i})
end

