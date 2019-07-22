class Train
  attr_reader :name, :train_type, :current_station, :train_carriages, :train_speed

  include CompanyName
  include InstanceCounter

  def self.find(find_train_name)
    items[find_train_name]
  end

  def initialize(train_name)
    @name = train_name
    @train_carriages = []
    @train_speed = 0
    @train_route = nil
    @current_station = nil
    validate!
    register_instance
  end

  def validate!
    raise NameError, 'NameTrainError' if @name !~ /\A[a-zA-Z0-9]{3}(-| )[a-zA-Z0-9]{2}\z/
  end

  def valid?
    return false if @name !~ /\A[a-zA-Z0-9]{3}(-|)[a-zA-Z0-9]{2}\z/

    true
  end

  def speed_up(speed)
    @train_speed += speed
  end

  def speed_slow(speed)
    @train_speed -= speed
    @train_speed = 0 if @train_speed.negative?
  end

  def carriages_number
    @train_carriages.size
  end

  def carriages_hook
    return @train_carriages.push(Carriage.new(@train_type)) if @train_speed.zero?

    p 'Поезд в движении, прицепить вагон нельзя'
  end

  def carriages_unhook
    return p 'Вагонов больше нет' if @train_speed.zero? && @train_carriages.size.zero?
    return @train_carriages.pop if @train_speed.zero?

    p 'Поезд в движении, отцепить вагон нельзя'
  end

  def route_add(route, station_start = route.route_stations.first)
    @train_route = route
    arrival(station_start)
    route_add_message
  end

  def route_next
    @current_station.train_departure(self)
    arrival(route_next_station) if route_next_station
  end

  def route_info
    route_info_message(@current_station, 'текущая')
    route_info_message(route_next_station, 'следующая') if route_next_station
    route_info_message(route_prev_station, 'предыдущая') if route_prev_station
  end

  def arrival(station)
    @current_station = station
    @current_station.train_arrival(self)
  end

  protected

  # Методы не используются в других классах, но используются в подклассах

  def station_of_route(position_change)
    station_index = @train_route.route_stations.index(@current_station) + position_change
    @train_route.route_stations[station_index]
  end

  def route_next_station
    station_of_route(+1)
  end

  def route_prev_station
    station_of_route(-1)
  end

  def route_add_message
    p "Добавлен маршрут следования к поезду #{@name}, маршрут следования: " +
      @train_route.route_stations.map(&:name).join(', ')
  end

  def route_info_message(station, state)
    p "У поезда № #{@name} #{state} станция #{station.station_name}"
  end
end
