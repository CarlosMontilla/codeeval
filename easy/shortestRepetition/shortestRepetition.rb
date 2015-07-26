#!/usr/bin/ruby
# Find the shortest substring that is repeated all over the original string

def isRepeated? subString, str

  if str.length % subString.length  != 0 then return false end

  n = subString.length
  max_repetitions = str.length / n
  (0...max_repetitions).each do |i|
    if str[n*i, n] != subString then return false end
  end
  return true
end

def findShortestSubStr str
  (1..(str.length / 2)).each do |i|
    if isRepeated? str[0,i], str then return str[0,i] end
  end
  return str
end

File.open(ARGV[0], 'r').read.split("\n").each do |line|
  puts (findShortestSubStr line).length
end

