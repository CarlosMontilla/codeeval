# Checks if a given number is even
def isEven?(n)
  if n % 2 == 0 then 1 else 0 end
end

File.open(ARGV[0]).read.split("\n").each {|i| puts isEven?(i.to_i)}

