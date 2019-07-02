train1 = Train.new(805, "cargo", 100)
train2 = Train.new(803, "cargo", 90)
train3 = Train.new(801, "cargo", 80)
train4 = Train.new(001, "pass", 15)
train5 = Train.new(010, "pass", 10)

station1 = Station.new("Kharkov")
station2 = Station.new("Poltava")
station3 = Station.new("Odessa")
station4 = Station.new("Kyev")
station5 = Station.new("Znamenka")

route1 = Route.new(station3, station2, station5, station1)
route2 = Route.new(station3, station4)
route3 = Route.new(station4, station2, station1)
route4 = Route.new(station1, station2, station4)

route1.route_list
train1.train_route(route1)


station1.train_arrival(train1)
station1.train_arrival(train2)
station1.train_arrival(train3)
station1.train_arrival(train4)
station1.train_arrival(train5)


train1.train_rout.route_stations.reject{|train| !train.station_train}

train1.train_rout.route_stations.each{|train| p train.station_name if train.station_train.train_name == 805}

train1.train_rout.route_stations.map{|station| [station.station_name, station.station_train.count]}

train1.train_rout.route_stations.each {|train|
  train.station_train.each{|i|
    p i if i.train_name == 803
  }
}

# station1.station_list_by_type
#
# station1.station_list_train
#
# station1.train_departure(train5)
#
# station1.station_train.each{|i| p i.train_type}
#
# station1.station_train.each{|i| p i.train_name if i.train_type == "cargo"}
