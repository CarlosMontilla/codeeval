#!/usr/bin/env ruby

class Point
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance(p)
    diffx = x - p.x
    diffy = y - p.y
    return Math.sqrt(diffx*diffx + diffy*diffy)
  end
end

File.open(ARGV[0],"r").read.split("\n").each do |s|
  points = s.delete("(),").split.map {|c| c.to_i}
  print "%d\n" % Point.new(points[0], points[1]).distance(Point.new(points[2], points[3]))
end
