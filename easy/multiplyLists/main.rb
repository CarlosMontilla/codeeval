#!/usr/bin/ruby

def multiplyList(lst1, lst2)
  lst = Array.new(lst1.length)
  (0...(lst1.length)).each {|i| lst[i] = lst1[i]*lst2[i]}
  return lst
end

File.open(ARGV[0],"r").read.split("\n").each do |line|
  lsts = line.split(" | ")
  puts multiplyList(lsts[0].split(" ").map {|i| i.to_i}, lsts[1].split(" ").map {|i| i.to_i}).join(" ")
end

