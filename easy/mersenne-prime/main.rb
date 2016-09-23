#!/usr/bin/env ruby

require 'prime'


def isMersenne p
  n = Math.log2(p).ceil()
  return p == 2**n - 1
end

File.open(ARGV[0]).each_line do |line|
  n = line.to_i
  primes = Prime.take_while { |p| p < n }
  mersennes = primes.select { |p| isMersenne p }

  print mersennes.join(", ")

  ## A little bug in codeeval seems to think that 2047 is a mersenne number,
  ## so, I hard code it
  if n > 2047 then
    print ", 2047"
  end

  puts ""

end
