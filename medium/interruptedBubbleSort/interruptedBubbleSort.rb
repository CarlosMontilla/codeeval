#!/usr/bin/ruby
#
# Applied bubble sort algorithm a given number of iteration

def bubbleSort lst, nIter
  (0...nIter).each do |j|
    (1...(lst.length - j)).each do |i|
      if lst[i - 1] > lst[i] then
        swap lst, i, i-1
      end
    end
  end
end

def swap lst, v1, v2
  temp = lst[v1]
  lst[v1] = lst[v2]
  lst[v2] = temp
end

File.open(ARGV[0],"r").each_line do |line|

  lst, iter = line.delete("\n").split(" | ")
  lst = lst.split(" ").map{|i| i.to_i}
  bubbleSort lst, iter.to_i
  print lst.join(" ") + "\n"
end
