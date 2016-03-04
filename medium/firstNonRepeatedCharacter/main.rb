#!/usr/bin/ruby
#
# Finds the first non repeated character in a string

def findFirstNonRepeatedChar str
  chr =[]
  repeated = {}
  str.split("").each do |c|
    idx = chr.index(c)
    if idx then
      chr.delete(c)
      repeated[c] = true
    elsif not repeated.has_key?(c) then
      chr.push(c)
    end
  end
  if chr.length > 0 then
    return chr[0]
  else
    return ""
  end
end

File.open(ARGV[0],"r").read.split("\n").each do |str|
  puts findFirstNonRepeatedChar str
end
