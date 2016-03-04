# Finds the larger prime palindrome under a given number n

require 'prime'

def palindrome? n
  str = n.to_s
  str == str.reverse
end

def findMaxPalindrome lst
  lst.reverse.each do |n|
    if palindrome? n then return n
    end
  end
  return false
end

n = 1000
primes = Prime.take_while {|p| p < n}
puts findMaxPalindrome primes

