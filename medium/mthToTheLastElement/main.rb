# Find the mth element in a list starting from the end

File.open(ARGV[0]).read.split("\n").each do |l|
  char = l.split(" ").reverse
  idx = char[0].to_i # element to find
  if idx > char.length + 1 then puts"" else puts char[idx] end
end
