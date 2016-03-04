#!/usr/bin/ruby
#
# Prints out the Pascal's triangle


def printPascalTriangle n
  if n == 1 then print "1"
  elsif n == 2 then print "1 1 1"
  else
    printPascalTriangle 2
    previusLevel = [1]
    (3..n).each do |i|
      print " "
      levelLength = (i + 1) / 2
      currentLevel = Array.new(levelLength)
      currentLevel[0] = 1
      (1...levelLength).each do |j|
        if i % 2 == 1 and j == levelLength - 1 then
          currentLevel[j] = 2*previusLevel[j-1]
        else
          currentLevel[j] = previusLevel[j-1] + previusLevel[j]
        end
      end

      if i % 2 == 0 then
        str = currentLevel.join(" ")
        reverse_str = currentLevel.reverse.join(" ")
        print str + " " + reverse_str
      else
        str = currentLevel[0,levelLength - 1].join(" ")
        reverse_str = currentLevel[0, levelLength - 1].reverse.join(" ")
        print str + " " + currentLevel[-1].to_s + " " + reverse_str
      end

      previusLevel = currentLevel
    end
  end
end


File.open(ARGV[0],"r").each_line do |line|
  n = line.delete("\n").to_i
  printPascalTriangle n
  puts ""
end
