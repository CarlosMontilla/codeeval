require 'io/console'
filename = ARGV[0]

file = File.open(filename, "r")
data = file.read
file.close
lines = data.split("\n")
sum = 0
lines.each do |str|
  sum = sum + str.to_i
end
puts sum
