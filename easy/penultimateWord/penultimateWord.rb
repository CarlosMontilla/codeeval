#! usr/bin/ruby

File.open(ARGV[0],"r").read.split("\n").each {|str| puts str.split(" ")[-2]}

