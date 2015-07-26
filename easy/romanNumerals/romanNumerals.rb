#!/usr/bin/ruby
# Transforms a decimal number in a roman numeral

@roman_dict = {
  1 => "I",
  5 => "V",
  10 => "X",
  50 => "L",
  100 => "C",
  500 => "D",
  1000 => "M",
}


def oneToRoman n
  n_str = n.to_s
  significant = n_str[0].to_i
  n_digits = n_str.length

  if significant < 4 then
    base_number = 1*10**(n_digits - 1)
    return @roman_dict[base_number] * significant

  elsif significant < 5 then
    base_number = 5*10**(n_digits - 1)
    return oneToRoman(base_number - n) + @roman_dict[base_number]

  elsif significant < 9 then
    base_number = 5*10**(n_digits - 1)
    return @roman_dict[base_number] + oneToRoman(n - base_number)

  else
    base_number = 5*10**(n_digits - 1)
    return oneToRoman(2*base_number - n) +  @roman_dict[2*base_number]
  end

end

def toRoman n
  sol = ""
  n_str = n.to_s
  n_digits = n_str.length
  (0..n_digits).each do |i|
    sol += oneToRoman(n_str[i].to_i * 10 ** (n_digits - 1 - i))
  end
  return sol
end

File.open(ARGV[0], "r").read.split("\n").each do |n|
  puts toRoman(n.to_i)
end
