#!/usr/bin/ruby
# It finds the major element that repeats more than a half of the list

# It does not work with list with negative numbers
def solveProblem lst
  big = -1
  numbers = {}
  half = lst.length / 2
  lst.each do |i|
    if numbers.has_key?(i) then
      numbers[i] += 1
    else
      numbers[i] = 1
    end
    if numbers[i] > half then return i end
  end
  return big
end


File.open(ARGV[0],'r').read.split("\n").each do |line|
  res = solveProblem (line.split(",").map {|i| i.to_i })
  if res == -1 then puts "None" else puts res end
end

