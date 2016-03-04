# Sort numbers
lines = File.open(ARGV[0]).read.split("\n")
lines.each do |l|
  l.split.map {|i| i.to_f}.sort.each {|i| print "%.3f " % i}
  puts ""
end

