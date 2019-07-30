#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
# a - 1, e - 5, i - 9, o - 15, u - 21, y - 25

letters = ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u', 'y']
i = 1

letters.each do |l|
  if vowels.include?(l)
    puts "#{l} - #{i}"
  end
  i += 1
end

