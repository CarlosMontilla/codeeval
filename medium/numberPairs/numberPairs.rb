#!/usr/bin/ruby

def findPairs lst, value
  dict = {}
  lst.each {|i| dict[i] = false}
  pairs = []
  lst.each do |i|
    objective = value - i
    if dict.has_key?(objective) and dict[i] == false and dict[objective] == false and i != objective then
      pairs.push(i.to_s + "," + objective.to_s)
      dict[objective] = true
      dict[i] = true
    end
  end
  if pairs.length > 0 then
    return pairs
  else
    ["NULL"]
  end
end

File.open(ARGV[0],"r").each_line do |line|
  if line != "\n" then
    lst, value = line.split(";")
    puts findPairs(lst.split(",").map {|i| i.to_i}, value.to_i).join(";")
  else
    print line
  end
end

