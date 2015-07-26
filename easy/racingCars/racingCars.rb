#!/usr/bin/ruby
# Finds the optimal route for a car

def findCheckpoint line
  return line.index("C")
end

def findGate line
  return line.index("_")
end

def findNextMove line
  checkPoint = findCheckpoint line
  if checkPoint
  then return checkPoint
  else return findGate line
  end
end

def drawMove nextPos, currentPos, line
  if nextPos < currentPos then
    line[nextPos] = "/"
  elsif nextPos == currentPos then
    line[nextPos] = "|"
  else line[nextPos] = "\\"
  end
  return line
end

data = File.open(ARGV[0],"r").read.split("\n")
currentPos = findNextMove data[0]

data.each do |line|
  nextMove = findNextMove line
  puts drawMove nextMove, currentPos, line
  currentPos = nextMove
end
