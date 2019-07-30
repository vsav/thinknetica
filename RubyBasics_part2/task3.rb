#3. Заполнить массив числами фибоначчи до 100

fib = [0, 1]
i = 1

#while fib[i] < 100
loop do
  i += 1
  fib[i] = fib[i-1] + fib [i-2]
  break if fib[-1]+fib[-2] > 100
end

print fib.inspect

