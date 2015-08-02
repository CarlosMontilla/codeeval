#!/usr/bin/ruby

def palindrome? str
  return str == str.reverse
end

def reverseAndAdd n
  nIter = 0
  begin
    nIter += 1
    n = (n.to_i + n.reverse.to_i).to_s
  end while not palindrome? n
  return n, nIter
end


File.open(ARGV[0],"r").read.split("\n").each do |line|
  value, iter = reverseAndAdd line
  print "#{iter} #{value}\n"
end
