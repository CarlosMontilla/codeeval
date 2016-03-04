# Finds the ratio between lowercase and uppercase letters

def lettercaseRatio str
  n_up = 0
  str.split("").each {|i| if i.upcase == i then n_up += 1 end}
  por_up = n_up / str.length.to_f * 100.0
  printf("lowercase: %.2f uppercase: %.2f\n",100.0 - por_up, por_up)
end

File.open(ARGV[0],"r").read.split("\n").each do |str|
  lettercaseRatio str
end
