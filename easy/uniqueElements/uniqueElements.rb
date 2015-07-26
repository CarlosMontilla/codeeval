filename = ARGV[0]
file = File.open(filename, "r")
lines = file.read.split("\n")
lines.each do |line|
  numbers = line.split(",")
  print numbers[0]
  (1...(numbers.length)).each {|i| if numbers[i] != numbers[i-1] then print ",#{numbers[i]}" end}
  puts ""
end

