class Train
  attr_accessor :train_name
  def initialize (train_name, train_type, train_cars_number)
    @train_name = train_name
    @train_type = train_type
    @train_cars_number = train_cars_number.to_i
    @train_speed = 0
  end

  def train_speed
    p "Скорость поезда #{@train_speed} км/ч"
  end

  def train_speed_up
    @train_speed +=20
  end

  def train_speed_slow
    if @train_speed.zero?
      p 'Поезд остановлен, скорость уменьшить нельзя'
    else
      @train_speed -=20
    end
  end

  def train_cars_number
    p "Количество вагонов в поезде #{train_cars_number} шт."
  end

  def train_cars_hook
    if @train_speed.zero?
      @train_cars_number +=1
    else
      p 'Поезд в движении, прицепить вагон нельзя'
    end
  end

  def train_cars_unhook
    if @train_speed.zero?
      if @train_cars_number.zero?
        p 'Вагонов больше нет'
      else
        @train_cars_number -=1
      end
    else
      p 'Поезд в движении, отцепить вагон нельзя'
    end
  end
end

