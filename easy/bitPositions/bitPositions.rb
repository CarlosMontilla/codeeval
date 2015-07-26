# Prints if two bits in the binary representation of a given number are equals

def bitsEqual?(n, b1, b2)
  bits = n.to_s(2).reverse
  return bits[b1 - 1] == bits[b2 - 1]
end

file = File.open(ARGV[0])
lines = file.read.split("\n")
lines.each do |str|
    numbers = str.split(",").map {|i| i.to_i}
    puts bitsEqual?(numbers[0], numbers[1], numbers[2])
end

