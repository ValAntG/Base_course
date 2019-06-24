puts "Введите a"
a = gets.to_i

puts "Введите b"
b = gets.to_i

puts "Введите c"
c = gets.to_i

d = (b**2 - 4 * a * c)

print "Дискриминант равен #{d}, "

case
when d < 0
  puts "корней нет"
when d == 0
  x = - b / (2 * a)
  puts "оба корня равны #{x}"
when d > 0
  x1 = (- b + Math.sqrt(d)) / (2 * a)
  x2 = (- b - Math.sqrt(d)) / (2 * a)
  puts "первый корень #{x1}, второй корень #{x2}"
end