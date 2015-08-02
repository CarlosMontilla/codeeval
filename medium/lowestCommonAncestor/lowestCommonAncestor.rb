#!/usr/bin/ruby

@tree = {
  30 => [nil, 1],
  8  => [30, 2],
  52 => [30, 2],
  3  => [8, 3],
  20 => [8, 3],
  10 => [20, 4],
  29 => [20, 4],
}

def findCommonAncestor n1, n2
  if n1 == n2 then return n1 end

  data_n1 = @tree[n1]
  data_n2 = @tree[n2]
  if data_n1[0] == data_n2[0] then return data_n1[0]
  elsif data_n1[1] > data_n2[1] then return findCommonAncestor data_n1[0], n2
  else return findCommonAncestor n1, data_n2[0]
  end
end

File.open(ARGV[0]).each_line do |line|
  data = line.delete("\n").split(" ").map {|c| c.to_i}
  puts findCommonAncestor data[0], data[1]
end
