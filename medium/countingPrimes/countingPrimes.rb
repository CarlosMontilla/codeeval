#!/usr/bin/ruby
#
# Counts the numbers of primes between two numbers (both inclusive)

require 'prime'

def numberPrimes n, m
  if n > m then
    lst = Prime.take_while {|p| p <= n}
    return lst.count {|p| p >= m}
  elsif
    lst = Prime.take_while {|p| p <= m}
    return lst.count {|p| p >= n}
  end
end

File.open(ARGV[0]).each_line do |line|
  data = line.delete("\n").split(",").map {|c| c.to_i}
  puts numberPrimes data[0], data[1]
end

