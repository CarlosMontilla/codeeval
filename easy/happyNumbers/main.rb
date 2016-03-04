# Calculates if a given number is happy

def isHappy? n
  acc = {}
  acc[n] = true
  begin
    sum = 0
    n.to_s.split("").map {|i| sum += i.to_i**2}

    if sum == 1 then return true
    elsif acc.has_key?(sum) then return false
    else acc[sum] = true end

    n = sum
  end while sum != 1
end

File.open(ARGV[0], 'r').read.split("\n").each do |s|
  if isHappy? (s.to_i) then puts 1 else puts 0 end
end
