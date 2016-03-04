#!/usr/bin/ruby
#
# Checks if a given string is parentheses balanced

def checkParentheses str
  characters = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
  }

  currentStack = []
  str.split("").each do |c|
    if characters.has_key?(c) then currentStack.push(c)
    elsif characters.has_value?(c) then
      if characters.key(c) == currentStack[-1] then dummy = currentStack.pop
      else return "False"
      end
    end
  end
  if currentStack.length == 0 then return "True"
  else return "False"
  end
end


File.open(ARGV[0]).each_line do |line|
  puts checkParentheses (line.delete("\n"))
end
