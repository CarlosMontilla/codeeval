class Stack
  def initialize()
    @lst = []
  end

  def push(n)
    @lst << n
  end

  def pop
    @lst.pop
  end

  def length
    @lst.length
  end
end

File.open(ARGV[0], 'r').read.split("\n").each do |str|
  numbers = str.split.map {|i| i.to_i}
  s = Stack.new()
  numbers.each {|i| s.push(i)}
  (0...s.length).step(2).each {|i| print "%d " % s.pop; s.pop}
  puts ""
end
