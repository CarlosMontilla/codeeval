#!/usr/bin/ruby
#
# Check if two rectangles overlap each other

class Rectangle

  attr_reader :x1, :y1, :x2, :y2

  def initialize(x1, y1, x2, y2)
    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2
  end

  def overlaps? r
    if x1 > r.x2 or x2 < r.x1 then return "False"
    elsif y1 < r.y2 or y2 > r.y1 then return "False"
    else return "True"
    end
  end
end

File.open(ARGV[0]).each_line do |line|
  data = line.delete("\n").split(",").map {|c| c.to_i}
  r1 = Rectangle.new(data[0], data[1], data[2], data[3])
  r2 = Rectangle.new(data[4], data[5], data[6], data[7])
  puts r1.overlaps? r2
end
