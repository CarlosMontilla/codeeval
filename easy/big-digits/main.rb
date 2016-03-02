#!/usr/bin/ruby
# Prints out a number in a "nice" way

@STR1 = "-**----*--***--***---*---****--**--****--**---**--"
@STR2 = "*--*--**-----*----*-*--*-*----*-------*-*--*-*--*-"
@STR3 = "*--*---*---**---**--****-***--***----*---**---***-"
@STR4 = "*--*---*--*-------*----*----*-*--*--*---*--*----*-"
@STR5 = "-**---***-****-***-----*-***---**---*----**---**--"
@STR6 = "--------------------------------------------------"


def getNumber n
  starts = n*5
  slice = 5
  return [@STR1[starts, slice],
          @STR2[starts, slice],
          @STR3[starts, slice],
          @STR4[starts, slice],
          @STR5[starts, slice],
          @STR6[starts, slice]]
end

def printNumber n_str
  str_lst = Array.new(6, "")
  n_str.split("").each do |s|
    n_rep = getNumber s.to_i
    (0...6).each {|i| str_lst[i] += n_rep[i]}
  end
  str = ""
  (0...6).each {|i| str += str_lst[i] + "\n"}
  return str
end

def isNumber? str
  return str.to_i.to_s == str
end

File.open(ARGV[0], 'r').read.split("\n").each do |line|
  number = ""
  line.split("").each {|c| if isNumber? c then number += c end}
  print printNumber(number)
end
