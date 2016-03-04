#!/usr/bin/ruby

def isNumeric? str
  return str.to_i.to_s == str
end

File.open(ARGV[0],'r').read.split("\n").each do |str|
  elements = str.split(",")
  num_elem = []
  str_elem = []
  elements.each {|e| if isNumeric? e then num_elem.push(e) else str_elem.push(e) end}
  sep = ""
  if num_elem.length != 0 and str_elem.length != 0 then sep = "|" end
  puts str_elem.join(",") + sep + num_elem.join(",")
end
