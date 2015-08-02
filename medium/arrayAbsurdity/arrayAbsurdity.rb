#!/usr/bin/ruby
#
# Finds a repeated number in a list of length N with the first N-2
# natural numbers and one of them is repeated

def sumN n
  return n*(n+1)/2
end

File.open(ARGV[0]).each_line do |line|
  line.delete!("\n")
  sum = 0
  current_number = "0"
  data = line.split(";")
  n = data[0].to_i
  (0...(data[1].length)).each do |i|
    if data[1][i] == "," then
      sum += current_number.to_i
      current_number = "0"
    else
      current_number += data[1][i]
    end
  end
  sum += current_number.to_i
  total = sumN (n-2)
  puts sum - total
end

