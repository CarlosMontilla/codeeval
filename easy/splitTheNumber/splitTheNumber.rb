#!/usr/bin/ruby

def evalCode (str_num, str_code)
  left = ""
  right = ""
  op = ""
  (0...(str_code.length)).each do |i|
    if str_code[i] == "+" or str_code[i] == "-" then
      op = str_code[i]
      left = str_num[0,i]
      right = str_num[i,str_num.length]
      break
    end
  end
  return eval (left.to_i.to_s + op + right.to_i.to_s)
end

File.open(ARGV[0],"r").read.split("\n").each do |str|
  str_split = str.split(" ")
  str_num = str_split[0]
  str_code = str_split[1]
  puts evalCode(str_num, str_code)
end

