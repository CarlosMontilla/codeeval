#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/208/
# Programmed by: Carlos Montilla

File.open(ARGV[0], "r").read.split("\n").each do |line|
  data = line.split(" | ")
  max = data[0].split(" ").map {|i| i.to_i}
  (1...data.length).each do |i|
    str = data[i]
    score = str.split(" ").map {|i| i.to_i}
    (0...score.length).each {|i| if score[i] > max[i] then max[i] = score[i] end}
  end
  puts max.join(" ")
end
