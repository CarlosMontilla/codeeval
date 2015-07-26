# Converts an hex number into decimal one
File.open(ARGV[0]).read.split("\n").each {|s| puts s.to_i(16)}

