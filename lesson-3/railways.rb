require 'pry'
require './station.rb'
require './route.rb'
require './train.rb'

train1 = Train.new(881, 'cargo', 100)
train2 = Train.new(882, 'cargo', 80)
train63 = Train.new(63, 'pass', 1)
train64 = Train.new(64, 'pass', 18)
train60 = Train.new(60, 'pass', 16)

station1 = Station.new('Kharkov')
station2 = Station.new('Poltava')
station3 = Station.new('Znamenka')
station4 = Station.new('Odessa')
station5 = Station.new('Mirgorod')
station6 = Station.new('Darnica')
station7 = Station.new('Kiev')

route1 = Route.new(station1, station2)
route2 = Route.new(station2, station1)
route63 = Route.new(station1, station2, station5, station6, station7)
route64 = Route.new(station7, station6, station5, station2, station1)
route60 = Route.new(station4, station3, station2, station1)

train1.route_add(route1)
train2.route_add(route2)
train60.route_add(route60, station2)
train63.route_add(route63, station1)
train64.route_add(route64, station6)

p '#   Cписок станций поезда №63'
route63.list_station

p '#   Отправление поезда со станции, увеличивание скорости и потом уменьшение'
station1.train_departure(train63)
train63.speed_up
train63.speed
train63.speed_up
train63.speed
train63.speed_slow
train63.speed
train63.speed_slow
train63.speed
train63.speed_slow

p '#   Прибытие поезда и отцепка и прицепка вагонов'
station2.train_arrival(train63)
train63.cars_number
train63.cars_unhook
train63.cars_number
train63.cars_unhook
train63.cars_number
train63.cars_hook
train63.cars_number

p '#   Информация о поездах по станции Полтава'
station2.list_by_type

p '#   Перемещение по маршруту поезда №63'
train63.route_info
train63.route_next
train63.route_info
train63.route_next
train63.route_info
train63.route_next
train63.route_next
train63.route_next
