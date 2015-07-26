filename = ARGV[0]

file = File.open(filename, "r")
data = file.read
file.close
numbers = data.split("\n")
numbers.each do |num|
  ints = num.split("")
  sum = 0
  ints.each {|i| sum += i.to_i}
  puts sum
end

