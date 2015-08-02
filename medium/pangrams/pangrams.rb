#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/37/
# Programmed by: Carlos Montilla

File.open(ARGV[0], "r").read.each_line do |line|
  alphabet = [*("a".."z")]
  line.downcase!
  line.split("").each {|c| alphabet.delete(c)}
  puts alphabet.length == 0 ? "NULL" : alphabet.join("")
end

  
