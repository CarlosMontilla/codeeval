#! /usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/180/
# Programmed by: Carlos Montilla

class Move 
  attr_reader :l, :n
  def initialize(l, n)
    @l = l
    @n = n
  end

  def to_s
    return l + n.to_s
  end

  def isLegal?
    return (("a".."h").include? l) && ((1..8).include? n)
  end

end

def findMoves square
  moves = []

  [-2, 2].each do |n|
    newLetter = (square.l.ord + n).chr
    moves.push(Move.new(newLetter, square.n + 1))
    moves.push(Move.new(newLetter, square.n - 1))             
  end

  [-2, 2].each do |n|
    newNumber = square.n + n
    moves.push(Move.new((square.l.ord + 1).chr, newNumber))
    moves.push(Move.new((square.l.ord - 1).chr, newNumber))             
  end

  legalMoves = []
  moves.each {|m| if m.isLegal? then legalMoves.push(m) end}
  
  return legalMoves.sort_by {|m| [m.l, m.n]}
end

File.open(ARGV[0], "r").read.split("\n").each do |line|
  square = Move.new(line[0], line[1].to_i)
  moves = findMoves square
  str = moves.map{|m| m.to_s}
  puts str.join(" ")
end
