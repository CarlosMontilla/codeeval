#!/usr/bin/ruby
#
# Card number validation code

def validateCardNumber lst
  lunhNumbers = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9]
  sum = 0
  lst_rev = lst.reverse
  (0...(lst_rev.length)).each do |i|
    if i % 2 ==0 then
      sum += lst_rev[i]
    else
      sum += lunhNumbers[lst_rev[i]]
    end
  end
  if sum % 10 == 0 then
    return 1
  else
    return 0
  end
end

File.open(ARGV[0]).each_line do |line|
  puts validateCardNumber(line.delete("\n").delete(" ").split("").map {|c| c.to_i})
end

