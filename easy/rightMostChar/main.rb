# Find the rightmost char in a str
file = File.open(ARGV[0],'r')
file.read.split("\n").each do |line|
  lst = line.split(",")
  pos = lst[0].reverse.index(lst[1])
  if pos then puts (lst[0].length - pos - 1) else puts "-1" end
end
