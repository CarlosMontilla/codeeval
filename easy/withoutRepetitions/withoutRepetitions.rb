# Eliminates cosecutive repeated chararcter in a string

def removeConsecutive str
  new_str = str[0]
  (1...(str.length)).each do |i|
    if str[i-1] != str[i] then new_str += str[i] end
  end
  return new_str
end

File.open(ARGV[0],'r').read.split("\n").each do |str|
  puts removeConsecutive str
end

