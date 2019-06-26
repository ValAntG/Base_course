print 'Введите число '
day = gets.to_i
print 'Введите номер месяца '
month = gets.to_i
print 'Введите год '
year = gets.to_i

month_array = {
  1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }

month_array[2] = 29 if year % 4 == 0 && year % 100 != 0 || year % 400 == 0

nomer_day = day
month_array.each_pair { |key, val| nomer_day += val if key < month }

puts nomer_day
