#!/usr/bin/ruby

def armstrong? n
  n_str = n.to_s
  n_digits = n_str.length
  sum = 0
  n_str.split("").each do |d|
    sum += d.to_i ** n_digits
  end
  return n == sum
end

File.open(ARGV[0],"r").read.split("\n").each do |n|
  if armstrong? (n.to_i)
  then puts "True"
  else puts "False"
  end
end
