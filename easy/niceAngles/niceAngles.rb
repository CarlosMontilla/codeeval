#!/usr/bin/ruby
# Converts a decimal angle into a hexadecimal one

def calculateHexRepresentation n
  n_str = n.to_s.split(".")
  angle = n_str[0].to_i
  decimal = ("0." + n_str[1]).to_f
  min = (decimal * 60.0).floor
  sec = (decimal * 3600.0 - min*60).floor
  return [angle,min,sec]
end

def printHexRepresentation n
  hex = (calculateHexRepresentation n).map {|i| i.to_s}
  while hex[1].length < 2 do
    hex[1] = "0" + hex[1]
  end
  while hex[2].length < 2 do
    hex[2] = "0" + hex[2]
  end

  return hex[0] + "." + hex[1] + "'" + hex[2] + '"'
end

File.open(ARGV[0],"r").read.split("\n").each do |n|
  puts printHexRepresentation(n.to_f)
end

