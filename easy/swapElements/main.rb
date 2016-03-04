#!/usr/bin/ruby

def swap(lst, v1, v2)
  temp = lst[v1]
  lst[v1] = lst[v2]
  lst[v2] = temp
end

File.open(ARGV[0],'r').read.split("\n").each do |line|
  line_splited = line.split(" : ")
  elements = line_splited[0].split(" ")
  swaps = line_splited[1].split(", ")
  swaps.each do |s|
    pos = s.split("-").map {|i| i.to_i}
    swap(elements,pos[0], pos[1])
  end
  puts elements.join(" ")
end

