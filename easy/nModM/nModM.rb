# Calculate mod without using any in-built function for that

def mod(n1, n2)
  n1 - (n1 / n2) * n2
end

File.open(ARGV[0]).read.split("\n").each do |str|
  num = str.split(",").map {|i| i.to_i}
  puts mod(num[0], num[1])
end

