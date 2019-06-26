puts "Введите ваше имя"
name = gets.chomp.capitalize!

puts "Введите ваш рост"
height = gets.chomp

weight = height.to_i - 110

if weight > 0
  p "У #{name} идеальный вес #{weight} кг."
else
  p "Ваш вес уже оптимальный"
end
