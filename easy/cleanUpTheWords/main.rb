#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/205/
# Programme by: Carlos Montilla

def isLetter? c
  match = (c =~ /[A-Za-z]/)
  if match == 0 then return true else return false end
end

def findWords line
  words = []
  current_word = ""
  status = 0
  line.split("").each do |c|

    if isLetter? c
      current_word += c
      status = 1
    elsif (not isLetter? c) and status == 1 
      status = 0
      words.push(current_word.downcase)
      current_word = ""
    end
  end

  if status == 1 then words.push(current_word.downcase) end

  return words
end

File.open(ARGV[0], "r").read.split("\n").each do |line|
  words = findWords line
  puts words.join(" ")
end
