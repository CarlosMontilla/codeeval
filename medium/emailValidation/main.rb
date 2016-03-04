#!/usr/bin/ruby
# Determines if a email direction is valid using regular expressions

def isValidEmail? str
  res1 = str =~ /^[_A-Za-z0-9\-\.\+\\]+(\.[_A-Za-z0-9\-]+)*@[A-Za-z0-9\-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/
  res2 = str =~ /^\"[_A-Za-z0-9\-\.\+@]+(\.[_A-Za-z0-9\-]+)*\"@[A-Za-z0-9\-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/
  if res1 or res2 then true else false end
end


File.open(ARGV[0],"r").read.split("\n").each do |str|
  res = isValidEmail? str
  puts res
end
