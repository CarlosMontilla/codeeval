filename = ARGV[0]

def fibonacciNth (n, acc = [1,1])
  diff = n - acc.length + 1
  if diff > 0
    (1..diff).each do
      acc.push(acc[acc.length - 2] + acc[acc.length - 1])
    end
  end
  acc
end


file = File.open(filename, "r")
data = file.read
file.close
fib = [0,1]
data.split("\n").each do |str|
  fib = fibonacciNth(str.to_i, fib)
  puts fib[str.to_i]
end

