#!/usr/bin/ruby
# Finds the difference between two hours

def deltaTime (t1, t2)
  (0..2).each do |i|
    if t1[i] < t2[i]
    then return difference(t2, t1)
    elsif t1[i] > t2[i]
    then return difference(t1, t2)
    end
  end
  return [0,0,0]
end


# Substracts two hours, only works if t1 > t2
def difference (t1, t2)
  diff = [0, 0, 0]
  minusMin = 0;
  minusHour = 0
  if t1[2] >= t2[2] then diff[2] = t1[2] - t2[2]
  else
    diff[2] = 60 - (t2[2] - t1[2])
    minusMin = 1
  end

  if t1[1] >= t2[1] then diff[1] = t1[1] - t2[1] - minusMin
  else
    diff[1] = 60 - (t2[1] - t1[1]) - minusMin
    minusHour = 1;
  end

  if t1[0] >= t2[0] then diff[0] = t1[0] - t2[0] - minusHour
  else diff[0] = 24 - (t2[0] - t1[0]) - minusHour
  end
  return diff
end

def printHour lst
  str_lst = lst.map {|i| i.to_s}
  (0...(str_lst.length)).each do |i|
    while str_lst[i].length < 2 do
      str_lst[i] = "0" + str_lst[i]
    end
  end
  str = str_lst[0] + ":" + str_lst[1] + ":" + str_lst[2]
  return str
end

def getHour str
  return str.split(":").map {|i|  i.to_i}
end



File.open(ARGV[0], "r").read.split("\n").each do |str|
  times = str.split(" ")
  t1 = getHour(times[0])
  t2 = getHour(times[1])
  diff = deltaTime(t1, t2)
  puts printHour(diff)
end
