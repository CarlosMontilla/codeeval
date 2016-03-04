#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/5/
# Programmed by: Carlos Montilla

def detectCycle lst

  elements = Hash.new()
  
  (0...lst.length).each do |i|
    if elements.has_key?(lst[i])
      starts = elements[lst[i]]
      starts.each do |s|
        longCycle = i - s
        c1 = lst[s, longCycle]
        c2 = lst[i, longCycle]
        if c1 == c2 then return c1 end
      end
      elements[lst[i]].push(i)
    else
      elements[lst[i]] = [i] 
    end
  end
  puts "Cycle not found"
  return []
end

File.open(ARGV[0], "r").read.split("\n").each do |line|
  lst = line.split(" ").map {|i| i.to_i}
  cycle = detectCycle lst
  puts cycle.join(" ")
end


