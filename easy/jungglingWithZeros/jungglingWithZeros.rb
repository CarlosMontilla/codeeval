#!/usr/bin/ruby
# Converts a zero sequence in a integer

def makeInteger lst
  str = ""
  (0...(lst.length)).step(2).each do |i|
    flag = lst[i].length - 1
    n_rep = lst[i+1].length
    str = appendValue(str, flag.to_s, n_rep)
  end
  return str.to_i(2)
end

def appendValue(str, value, n)
  new_str = ""
  (0...n).each {|dummy| new_str += value}
  return str + new_str
end


File.open(ARGV[0],"r").read.split("\n").each do |str|
  puts makeInteger(str.split(" "))
end

