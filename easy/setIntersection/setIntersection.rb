# Prints out the intersection of two sets
file = File.open(ARGV[0], 'r')
lines = file.read.split("\n")
lines.each do |str|
  sets = str.split(";").map {|s| s.split(",")}
  print (sets[0] & sets[1]).join(",") + "\n"
end

