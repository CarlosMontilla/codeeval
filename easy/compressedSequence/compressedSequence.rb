#!/usr/bin/ruby
# Compresses a sequence of numbers

def compress lst
  new_lst = []
  current_digit = lst[0]
  repetitions = 1
  (1...(lst.length)).each do |i|
    if lst[i-1] == lst[i]
    then repetitions += 1
    else
      new_lst.push(repetitions)
      new_lst.push(current_digit)
      repetitions = 1
      current_digit = lst[i]
    end
  end
  new_lst.push(repetitions)
  new_lst.push(current_digit)
  return new_lst
end

File.open(ARGV[0],"r").read.split("\n").each do |str|
  print (compress(str.split(" ").map {|c| c.to_i}).join(" ")) + "\n"
end

