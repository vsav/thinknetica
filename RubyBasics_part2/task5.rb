=begin
  5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
  Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
  (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
  Алгоритм опредления високосного года: www.adm.yar.ru
=end

months = {january: 31, february: 28, march: 31, april: 30, may: 31, june: 30, july: 31, august: 31, september: 30, october: 31, november: 30, december: 31}

yy = 0
mm = 0
dd = 0
days_total = 0

puts "Введите дату: "

until yy > 0
  puts "Год(1-..): "
  yy = gets.chomp.to_i
end

if yy %4 == 0 && yy %100 == 0
  puts "#{yy} год - не високосный"
elsif yy %4 == 0 || yy %400 == 0
  puts "#{yy} год - високосный"
  months[:february] = 29
else
  puts "#{yy} год - не високосный"
end

until mm >= 1 && mm <= 12
  puts "Месяц (1-12): "
  mm = gets.chomp.to_i
end

month_days = months.values[mm-1]

until dd >= 1 && dd <= month_days
  puts "Число (1-#{month_days}): "
  dd = gets.chomp.to_i
end

if mm == 1
  days_total = dd
else 
  i = 0
  while i < (mm-1)
    days_total += months.values[i]
    i+=1
  end
  days_total += dd
end

puts "С начала года прошло #{days_total} дней"



