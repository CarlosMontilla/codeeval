#!/usr/bin/ruby

def determineChange price, cash
  money = [[100.0, "ONE HUNDRED"],
           [50.0, "FIFTY"],
           [20.0, "TWENTY"],
           [10.0, "TEN"],
           [5.00, "FIVE"],
           [2.00, "TWO"],
           [1.00, "ONE"],
           [0.50, "HALF DOLLAR"],
           [0.25, "QUARTER"],
           [0.10, "DIME"],
           [0.05, "NICKEL"],
           [0.01, "PENNY"]]

  if price > cash then return ["ERROR"]
  elsif price == cash then return ["ZERO"]
  else
    lst_change = []
    money_left = cash - price
    money.each do |bill|
      number_bills = money_left.div bill[0]
      money_left = (money_left*100 - number_bills * bill[0]*100).round / 100.0
      (0...number_bills).each {lst_change.push(bill[1])}
    end
  end
  return lst_change
end

File.open(ARGV[0],"r").read.split("\n").each do |line|
  data = line.split(";")
  puts (determineChange(data[0].to_f, data[1].to_f)).join(",")
end
