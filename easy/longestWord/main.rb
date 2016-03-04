#!/usr/bin/ruby
def longestWord str_lst
  longest = ""
  length = 0
  str_lst.each do |str|
    if str.length > length then
      longest = str
      length = str.length
    end
  end
  return longest
end

File.open(ARGV[0],"r").read.split("\n").each do |line|
  puts longestWord(line.split(" "))
end
