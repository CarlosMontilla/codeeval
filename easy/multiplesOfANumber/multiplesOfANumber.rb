
def findFactor (n1, n2, org)
    if n1 <= n2 then return 1
    else return (1 + findFactor(n1, n2 + org, org))
    end
end

file = File.open(ARGV[0], 'r')
lines = file.read.split("\n")
lines.each do |line|
  numbers = line.split(",").map {|i| i.to_i}
  puts numbers[1]*findFactor(numbers[0], numbers[1], numbers[1])
end

