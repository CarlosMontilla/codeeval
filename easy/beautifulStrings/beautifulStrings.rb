#!/usr/bin/ruby
# Find the score of a given strings
@alph = "abcdefghijklmnopqrstuvwxyz"

def count str
  letters = {}
  str.split("").each do |c|
    if @alph.include? c then
      if letters.has_key? c then letters[c] += 1
      else letters[c] = 1
      end
    end
  end
  return letters
end

def getPoints letters
  letter_order = letters.sort do |a,b|
    a[1] <=> b[1]
  end
  letter_order.reverse!
  sum = 0
  idx = 26;
  letter_order.each do |c|
    sum += idx*c[1]
    idx -= 1
  end
  return sum
end


file = File.open(ARGV[0], "r")
file.read.split("\n").each {|s| puts getPoints( count(s.downcase) )}

