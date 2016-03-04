#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/17/
# Programmed by: Carlos Montilla

def changeSign? a, b
  if a * b > 0 then return false
  elsif (a * b == 0 && (a > 0 || b > 0)) then return false
  else return true
  end
end

def preprocessLst lst
  sum = lst[0]
  newLst = []

  # Gathers together contiguous negative and positive numbers
  (1...lst.length).each do |i|
    if changeSign? lst[i-1], lst[i]
      newLst.push(sum)
      sum = lst[i]
    else
      sum += lst[i]
    end
  end

  # Add last sum if it is positive
  if sum > 0 then newLst.push(sum) end
  
  # Remove the first entry if it is negative
  if newLst[0] < 0 then newLst.delete_at(0) end

  return newLst
end

def findMaxSum lst
  currentSum = lst[0]
  maxSum = currentSum
  (1...(lst.length - 1)).step(2) do |i|

    if currentSum + lst[i] > 0 
      currentSum += (lst[i] + lst[i+1])
    else
      currentSum = lst[i+1]
    end
    
    if currentSum > maxSum then maxSum = currentSum end

  end
  return maxSum
end

File.open(ARGV[0], "r").read.split("\n").each do |line|

  lst = line.split(",").map {|i| i.to_i}
  
  # If all entries all negative, print the least negative
  # Otherwise runs the algorithm 
  if lst.max <= 0 then puts lst.max
  else  
    newLst = preprocessLst lst
    puts findMaxSum newLst
  end
end
