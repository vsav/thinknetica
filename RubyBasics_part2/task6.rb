=begin
  6. Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара
  (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор,
  пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
  Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш,
  содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
  Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end

cart = {}
cart_total = 0

loop do
  puts 'Введите название товара (стоп для завершения): '
  item_name = gets.strip.capitalize
  break if item_name == 'Стоп'

  while item_name.empty?
    puts 'Наименование не может быть пустым: '
    item_name = gets.strip.capitalize
  end

  puts 'Введите цену за единицу товара: '
  item_price = gets.chomp.to_f
  until item_price.positive?
    puts 'Введите положительное число: '
    item_price = gets.chomp.to_f
  end

  puts 'Введите количество купленного товара: '
  item_count = gets.chomp.to_f
  until item_count.positive?
    puts 'Введите положительное число: '
    item_count = gets.chomp.to_f
  end

  cart[item_name] = { item_price => item_count }
end

system 'clear'

cart.each do |key, value|
  puts "Наименование товара: #{key}"
  value.each do |price, count|
    puts "Цена за единицу товара: #{price}"
    puts "Количество: #{count}"
    item_total = price * count
    puts "Сумма: #{item_total}"
    cart_total += item_total
  end
end
puts '*' * 40
puts "Общая сумма за все товары: #{cart_total}"
