# Makes a str a roller coaster

def letter? c
    c =~ /[[:alpha:]]/
end

def rollercoaster str
  up = true
  (0...str.length).each do |i|
    if letter?(str[i]) then
      if up then
        str[i] = str[i].upcase
      else
        str[i] = str[i].downcase
      end
      up = not(up)
    end
  end
  str
end

File.open(ARGV[0],"r").read.split("\n").each {|s| print rollercoaster s + "\n"}

