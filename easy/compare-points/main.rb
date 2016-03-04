#! /usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/192/
# Programmed by Carlos Montilla

class Point
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def direction(p)

    dir = vertical(p) + horizontal(p)
    if dir == "" then return "here"
    else return dir
    end

  end

  def vertical(p)
    if (y > p.y) then return "S"
    elsif (y < p.y) then return "N"
    else return ""
    end
  end

  def horizontal(p)
    if x > p.x then return "W"
    elsif x < p.x then return "E"
    else return ""
    end
  end
  
  private :vertical, :horizontal
  
end


File.open(ARGV[0]).read.split("\n").each do |line|
  data = line.split(" ").map {|i| i.to_i}
  p1 = Point.new(data[0], data[1])
  p2 = Point.new(data[2], data[3])
  puts p1.direction(p2)
end
    
