def carriage_input(train)
  print '     Выберите номер вагона: '.light_blue
  carriages_number = gets.chomp.to_i - 1
  train.train_carriages[carriages_number]
end

def carriage_editor(train)
  train_info(train)
  carriage = carriage_input(train)
  puts '     Выберите операцию какую хотите выполнить с вагоном:'.light_blue
  p '     1 - загрузить груз в вагон' if train.train_type == 'cargo'
  p '     1 - посадить одного пассажира' if train.train_type == 'pass'
  p '     0 - для выхода в главное меню'
  carriage_editor_operation(carriage)
end

def carriage_take(carriage)
  if carriage.carriage_type == 'pass'
    quantity = 1
  elsif carriage.carriage_type == 'cargo'
    print 'Введите количество загруженного груза: '.light_blue
    quantity = gets.chomp.to_i
  end
  if carriage.space_free >= quantity
    carriage.take_space(quantity)
    puts "В вагоне свободного места - #{carriage.space_free}".yellow
  else
    puts "В вагоне нет свободного места, осталось только #{carriage.space_free}".red
    carriage_take(carriage) if carriage.carriage_type == 'cargo'
  end
end

def carriage_editor_operation(carriage)
  operation = gets.chomp.to_i
  case operation
  when 1
    carriage_take(carriage)
  end
  carriage_editor_operation(carriage) unless operation.zero?
end
