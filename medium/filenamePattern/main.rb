#!/usr/bin/ruby
#
# Matches file names following a regex
# Programmed by: Carlos Montilla

def createRegex str
  regex = "^"
  (0...(str.length)).each do |i|
    if str[i] == "?" then regex += "."
    elsif str[i] == "*" then regex += ".*"
    elsif str[i] == "." then regex += "\\."
    else regex += str[i] end
  end
  regex += "$"
  return regex
end

File.open(ARGV[0]).each_line do |line|
  line.delete!("\n")
  data = line.split(" ")
  str_regex = createRegex data[0]
  regex = /#{str_regex}/
#  print data[0], " ", str_regex, " ", regex
  files = []
  (1...(data.length)).each do |i|
    str = data[i]
    if str =~ regex then files.push(str)
    end
  end
  if files.length > 0 then
    print files.join(" ")
  else
    print "-"
  end
  puts ""
end
