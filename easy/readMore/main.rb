# Process a string keeping its length below 55 characters

def processString str
  max_length = 55
  cut_position = 40
  if str.length > max_length
    new_str = str[0,cut_position]
    pos_space = new_str.rindex(" ")
    if pos_space then new_str = new_str[0, pos_space] end
    return new_str.strip + "... <Read More>"
  else
    return str
  end
end


File.open(ARGV[0],"r").read.split("\n").each {|s| puts processString(s)}

