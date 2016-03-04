#!/usr/bin/ruby

File.open(ARGV[0],"r").read.split("\n").each do |line|
  dist = []
  line.split("; ").each {|city| dist.push(city.split(",")[1].to_i)}
  dist.sort!
  print dist[0].to_s
  (1...(dist.length)).each {|i| print "," + (dist[i] - dist[i-1]).to_s}
  puts ""
end

