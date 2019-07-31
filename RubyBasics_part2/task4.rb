#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
# a - 1, e - 5, i - 9, o - 15, u - 21, y - 25

letters = ('a'..'z').to_a
vowels = %w[a e i o u y]
hash = {}

letters.each_with_index { |letter, index| hash[letter] = index + 1 if vowels.include?(letter) }

print hash.inspect
