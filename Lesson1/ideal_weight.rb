# Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле <рост> - 110,
# после чего выводит результат пользователю на экран с обращением по имени.
# Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"

print "Как Вас зовут? "
user_name = gets.chomp.capitalize
print "Какой у Вас рост? "
begin
  user_height = Integer(gets)
  rescue ArgumentError
    print "Вес должен быть целым числом: "
    retry
end
ideal_weight = user_height - 110
if ideal_weight < 0
  puts "#{user_name}, Ваш вес уже оптимальный"
else
  puts "#{user_name}, Ваш оптимальный вес: #{ideal_weight}кг."
end

