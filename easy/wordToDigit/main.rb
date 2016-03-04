#! /usr/bin/ruby

numbers = {
  "zero" => 0,
  "one"  => 1,
  "two"  => 2,
  "three"=> 3,
  "four" => 4,
  "five" => 5,
  "six"  => 6,
  "seven"=> 7,
  "eight"=> 8,
  "nine" => 9
}


File.open(ARGV[0], 'r').read.split("\n").each do |str|
  str.split(';').each {|i| print numbers[i]}
  puts " "
end
