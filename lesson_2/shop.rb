cost = 0
shop = {}

loop do
  print 'Введите название товара или стоп '
  type = gets.chomp.to_s
  break if type == 'стоп'
  print 'Введите цену за ед. товара '
  price = gets.chomp.to_i
  print 'Введите количество товара '
  number = gets.chomp.to_i
  shop.merge!(type => { price => number })
end

puts shop

shop.each_pair do |type, value|
  print "Товар #{type} стоимостью "
  value.each_pair { |price, number| puts "#{cost += price * number} у.е." }
end

puts "Итоговая сумма всех покупок в корзине #{cost} у.е."
