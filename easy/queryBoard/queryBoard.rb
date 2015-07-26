#!/usr/bin/ruby
# Implements a board with set row and column
# and get the sum over row and columns


class Board

  def initialize(nrow = 256, ncol = 256, value = 0)
    @board = Array.new(nrow) {Array.new(ncol, value)}
    @nrow = nrow
    @ncol = ncol
  end

  def to_s
    s = ""
    @board.each {|row| s += row.to_s + "\n"}
    return s
  end

  def setColumn(col, value)
    (0...@nrow).each {|r| set(r, col, value)}
  end

  def setRow(row, value)
    (0...@ncol).each {|c| set(row, c, value)}
  end

  def getColumn(col)
    lst = Array.new(@nrow)
    (0...@nrow).each { |row| lst[row] = @board[row][col]}
    return lst
  end

  def getRow(row)
    return @board[row]
  end

  def set(i, j, value)
    @board[i][j] = value
    print
  end

end

board = Board.new(256, 256, 0)
File.open(ARGV[0],"r").read.split("\n").each do |line|
  order = line.split(" ")
  if order[0] == "SetCol" then board.setColumn(order[1].to_i, order[2].to_i)
  elsif order[0] == "SetRow" then board.setRow(order[1].to_i, order[2].to_i)
  elsif order[0] == "QueryCol" then puts board.getColumn(order[1].to_i).inject(:+)
  elsif order[0] == "QueryRow" then puts board.getRow(order[1].to_i).inject(:+)
  end
end
