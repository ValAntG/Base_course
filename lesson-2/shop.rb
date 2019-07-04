total_price = 0
shop = {}

loop do
  print 'Введите название товара или стоп '
  type = gets.chomp.to_s
  break if type == 'стоп'
  print 'Введите цену за ед. товара '
  price = gets.chomp.to_i
  print 'Введите количество товара '
  number = gets.chomp.to_i
  shop.merge!(type => { price: price, number: number })
end

puts shop

shop.each do |type, value|
  cost = value[:price] * value[:number]
  p "Товар #{type} стоимостью #{cost} у.е."
  total_price += cost
end

p "Итоговая сумма всех покупок в корзине #{total_price} у.е."
