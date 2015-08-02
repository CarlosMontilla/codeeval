#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/32/
# Programmed by Carlos Montilla

File.open(ARGV[0], "r").read.split("\n").each do |line|
  data = line.split(",")
  mainStr = data[0]
  subStr = data[1]
  if mainStr[mainStr.length - subStr.length, subStr.length] == subStr
    puts 1
  else
    puts 0
  end
end
