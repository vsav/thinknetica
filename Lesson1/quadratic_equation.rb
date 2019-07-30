=begin
  Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D) и корни уравнения
  (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран.
  При этом возможны следующие варианты:
    Если D > 0, то выводим дискриминант и 2 корня
    Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
    Если D < 0, то выводим дискриминант и сообщение "Корней нет"
  Подсказка: Алгоритм решения с блок-схемой (www.bolshoyvopros.ru).
  Для вычисления квадратного корня, нужно использовать  
=end

puts "Программа вычисления квадратного уравнения"
puts "*"*50
puts
print "Введите коэффициет a: "
a = gets.chomp.to_i
until a.integer? && a != 0
  print "Коэффициент a должен быть целым числом и не должен быть равен 0: "
  a = gets.chomp.to_i
end
print "Введите коэффициет b: "
begin
  b = Integer(gets)
  rescue ArgumentError
    print "Коэффициент b должен быть целым числом: "
    retry
end
print "Введите коэффициет c: "
begin
  c = Integer(gets)
  rescue ArgumentError
    print "Коэффициент c должен быть целым числом: "
    retry
end

d = b ** 2 - (4 * a * c)

if d > 0
  x1 = (- b + Math.sqrt(d)) / (2 * a)
  x2 = (- b - Math.sqrt(d)) / (2 * a)
  puts "Дискриминант: #{d}"
  puts "x1:  #{x1}"
  puts "x2:  #{x2}"
elsif d == 0
  x = - b / (2 * a)
  puts "Дискриминант:  #{d}"
  puts "x: #{x}"
else 
  puts "Дискриминант:  #{d}"
  puts "Корней нет"
end
