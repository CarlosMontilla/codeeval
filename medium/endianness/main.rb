#!/usr/bin/ruby
#
# Prints the endianness of a system

puts ("Ruby".unpack("i")[0] == 2036495698)? "LittleEndian": "BigEndian"

