#!/usr/bin/ruby
#
# Reverse k elements in a list at the time


def reverseK lst, k
  new_lst = Array.new(lst.length)
  n_groups = lst.length / k
  (0...n_groups).each do |i|
    new_lst[i * k, k] = lst[i*k, k].reverse
  end
  new_lst[n_groups * k,lst.length - n_groups*k] =
    lst[n_groups * k,lst.length - n_groups*k]

  return new_lst
end

File.open(ARGV[0]).each_line do |line|
  data = line.delete("\n").split(";")
  puts reverseK(data[0].split(",").map {|c| c.to_i}, data[1].to_i).join(",")
end

