#!/usr/bin/env ruby

# Solves the codeeval challenge: https://www.codeeval.com/open_challenges/84/
# Programmed by: Carlos Montilla

def isBalanced? str

  nParentheses = 0
  smiley = 0
  frowny = 0

  (0...str.length).each do |i|
    
    if str[i] == ":" && str[i+1] == "(" then frowny += 1 
    elsif str[i] == ":" && str[i+1] == ")" then smiley += 1 end

    if str[i] == "(" then nParentheses += 1
    elsif str[i] == ")" then nParentheses -= 1 end

    if nParentheses < 0 
      if smiley >= nParentheses.abs
        smiley -= nParentheses.abs
        nParentheses = 0
      else
        return false
      end
    end
  end

  if nParentheses == 0 then return true
  elsif frowny >= nParentheses then return true
  else return false end
  
end


File.open(ARGV[0], "r").read.each_line do |line|
  puts isBalanced?(line) ? "YES" : "NO"
end
