#!/usr/bin/ruby

def guess low, up, str
  currentNumber = ((up - low) / 2.0).ceil + low
  if str[0] == "Lower" then
    return guess low, (currentNumber - 1), str[1,str.length]
  elsif str[0] == "Higher"
    return guess (currentNumber + 1), up, str[1,str.length]
  else
    return currentNumber
  end
end

File.open(ARGV[0],"r").read.split("\n").each do |line|
  data = line.split(" ")
  puts guess 0, data[0].to_i, data[1,data.length]
end
