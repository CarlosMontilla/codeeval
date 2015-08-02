#!/usr/bin/ruby
#
# Determines if a point is inside of a circle

class Point
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance(p)
    return Math.sqrt((x - p.x)**2 + (y - p.y)**2)
  end
end

rg = /Center: \((.*), (.*)\); Radius: (.*); Point: \((.*), (.*)\)/
File.open(ARGV[0]).each_line do |line|
  line.delete!("\n")
  data = line.scan(rg)[0]
  p1 = Point.new(data[0].to_f, data[1].to_f)
  p2 = Point.new(data[3].to_f, data[4].to_f)
  if (p1.distance p2) > data[2].to_f then puts false else puts true end
end

