#! /usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/178/
# Programmed by: Carlos Montilla

include Math

def rotate90(matrix, nrow, ncol)
  if matrix.length == 0
    return []
  else
    elements = []
    (0...nrow).reverse_each do |i|
      elements.push(matrix[i*ncol])
      matrix.delete_at(i*ncol)
    end
    return elements + rotate90(matrix, nrow, ncol - 1)
  end
end

File.open(ARGV[0]).read.split("\n").each do |line|
  matrix = line.split(" ")
  dim = Math.sqrt(matrix.length).to_i
  rotatedMatrix = rotate90(matrix, dim, dim)
  puts rotatedMatrix.join(" ")
end
