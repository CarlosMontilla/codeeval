#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/196/
# Programmed by: Carlos Montilla

def swapNumbers word
  return word[word.length - 1] + word[(1...(word.length - 1))] + word[0]
end

File.open(ARGV[0], "r").read.split("\n").each do |line|
  data = line.split(" ")
  newData = data.map {|w| swapNumbers(w)}
  puts newData.join(" ")
end
