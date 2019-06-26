puts "Введите a"
a = gets.to_i

puts "Введите b"
b = gets.to_i

puts "Введите c"
c = gets.to_i

discriminant = (b**2 - 4 * a * c)

print "Дискриминант равен #{discriminant}, "

case
when discriminant < 0
  puts "корней нет"
when discriminant == 0
  x = - b / (2 * a)
  puts "оба корня равны #{x}"
when discriminant > 0
  x1 = (- b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (- b - Math.sqrt(discriminant)) / (2 * a)
  puts "первый корень #{x1}, второй корень #{x2}"
end
