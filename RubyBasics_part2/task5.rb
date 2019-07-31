=begin
  5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
  Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
  (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
  Алгоритм опредления високосного года: www.adm.yar.ru
=end

months = { january: 31, february: 28, march: 31, april: 30, may: 31, june: 30,
           july: 31, august: 31, september: 30, october: 31, november: 30,
           december: 31 }

yy = mm = dd = days_total = 0

puts 'Введите дату: '

until yy.positive?
  puts 'Год(1-..): '
  yy = gets.chomp.to_i
end

if yy % 4 == 0 && yy % 100 != 0 || yy % 400 == 0
  puts "#{yy} год - високосный"
  months[:february] = 29
else
  puts "#{yy} год - не високосный"
end

until mm >= 1 && mm <= 12
  puts 'Месяц (1-12): '
  mm = gets.chomp.to_i
end

month_days = months.values[mm - 1]

until dd >= 1 && dd <= month_days
  puts "Число (1-#{month_days}): "
  dd = gets.chomp.to_i
end

(mm - 1).times do |i|
  days_total = months.values[0..i].reduce(0) { |sum, days| sum + days }
end

puts "С начала года прошло #{days_total + dd} дней"

=begin
  (mm - 1).times do |i|
    days_total += months.values[i]
  end

  days_total = months.values[0..(mm - 1)].reduce(0) { |sum, days| sum + days } - undefined method `reduce' for 31:Integer

  (mm - 1).times do |i|
    days_total = months.values[0..i].sum
  end
=end