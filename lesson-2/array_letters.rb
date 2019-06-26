letter = 'а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я'
letter_array = letter.split(' ')
vowels_hash = {}
letter_array.each_with_index { |lett, nomer| vowels_hash[lett] = nomer + 1 if 'аеёиоуэюя'.include?(lett) }
puts vowels_hash
