bukva = 'а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я'
bukva_array = bukva.split(" ")
glasnie = 'а е ё и о у э ю я'
glasnie_array = glasnie.split(" ")
glasnie_hash = {}
bukva_array.each_with_index { |bukva, nomer| glasnie_hash[bukva] = nomer + 1 if glasnie_array.include?(bukva) }
puts glasnie_hash
