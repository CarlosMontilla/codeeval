#!/usr/bin/ruby
require 'json'

File.open(ARGV[0],"r").read.split("\n").each do |str|
  data = JSON.parse(str)["menu"]["items"]
  sum = 0
  data.each {|dict| if dict then if dict.has_key?("label") then sum += dict["id"] end end}
  puts sum

end

