#! /usr/bin/env ruby

# solves the codeeval challenge: https://www.codeeval.com/open_challenges/186/
# Prgrammed by Carlos Montilla

def maxRangeSum(lst, range)
  maxSum = lst[0,range].reduce(:+)
  oldSum = maxSum
  (range..(lst.length - 1)).each do |i|
    newSum = oldSum - lst[i - range] + lst[i]
    if newSum > maxSum then maxSum = newSum end
    oldSum = newSum
  end
  return maxSum
end


File.open(ARGV[0],"r").read.split("\n").each do |line|
  data = line.split(";")
  range = data[0].to_i
  lst = data[1].split(" ").map {|i| i.to_i}
  sum = maxRangeSum(lst, range)
  if sum > 0 then puts sum else puts 0 end
end
