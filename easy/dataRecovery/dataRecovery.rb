#!/usr/bin/ruby

def organize(str, lst)
  organized_lst = Array.new(str.length)
  reversed_str = str.reverse
  lst.each {|i| organized_lst[i-1] = reversed_str.pop}
  (0...(organized_lst.length)).each {|i| if not organized_lst[i] then organized_lst[i] = reversed_str.pop() end}
  return organized_lst.join(" ")
end

File.open(ARGV[0],"r").read.split("\n").each do |lst|
  split_lst = lst.split(";")
  str_lst = split_lst[0].split(" ")
  num_lst = split_lst[1].split(" ").map {|i| i.to_i}
  print organize(str_lst, num_lst) + "\n"
end

