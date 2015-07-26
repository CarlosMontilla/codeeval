# Capitalize the words in a String
File.open(ARGV[0]).read.split("\n").each do |line|
  print line.split(" ").map {|l| l[0] = l[0].capitalize; l}.join(" ")
  puts ""
end
