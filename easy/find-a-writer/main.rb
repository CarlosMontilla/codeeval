#!/usr/bin/ruby

def findWriter (code, key)
  writer = ""
  key.each {|i| writer += code[i-1]}
  return writer
end


File.open(ARGV[0]).read.split("\n").each do |line|
  split_line = line.split("| ")
  puts findWriter(split_line[0], split_line[1].split(" ").map {|i| i.to_i})
end
