# Finds the larger prime palindrome under a given number n

require 'prime';

n = 1000

primes = Prime.take n
puts primes.inject(:+)

