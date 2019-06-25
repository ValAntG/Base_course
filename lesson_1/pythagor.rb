puts "Введите первую сторону треугольника"
a = gets.to_i

puts "Введите вторую сторону треугольника"
b = gets.to_i

puts "Введите третью сторону треугольника"
c = gets.to_i

triangle = [a, b, c].sort!

if triangle[2]**2 == triangle[0]**2 + triangle[1]**2
  puts "Согласно теоремы Пифагора треугольник прямоугольный"
  puts "и равнобедренный" if triangle[0]**2 == triangle[1]**2
elsif triangle[0] == triangle[1] && triangle[0] == triangle[2]
  puts 'Треугольник равнобедренный и равносторонний, но не прямоугольный'
else
  puts 'Обычный треугольник'
end