#!/usr/bin/env ruby

# Solve the codeeval challenge: https://www.codeeval.com/open_challenges/202/
# Programmed by: Carlos Montilla

def stringStepwise str
  stepwise = str[0]
  count = 1
  str[(1..str.length)].each_char do |c|
    stepwise += " " + "*"*count + c
    count += 1
  end
  return stepwise
end

def findLongestWord lst
  long = lst[0]
  lst[(1..lst.length)].each do |w|
    if w.length > long.length then long = w end
  end
  return long
end

File.open(ARGV[0], "r").read.split("\n").each do |line|
  words = line.split(" ")
  longest = findLongestWord words
  puts stringStepwise longest
end
