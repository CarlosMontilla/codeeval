# Reads a file and prints it out in lowercase
filename = ARGV[0]

file = File.open(filename, 'r')
puts file.read.downcase
file.close

