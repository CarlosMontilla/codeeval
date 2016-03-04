(1..12).each do |i|
  print "#{i}"
  (2..12).each do |j|
    print "%4.i" % (i*j)
  end
  puts ""
end
