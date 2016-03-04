#!/usr/bin/ruby
#
# Finds the minimun amount of coin to give in change
# Programmed by: Carlos Montilla

def calculateCoins n
  coins = [5, 3, 1]
  ncoins = 0
  current_value = n
  coins.each do |c|
    nc = current_value / c
    ncoins += nc
    current_value -= c*nc
  end
  return ncoins
end

File.open(ARGV[0]).each_line do |line|
  puts calculateCoins (line.delete("\n").to_i)
end
