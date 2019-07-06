require_relative '../../station'
require_relative '../../train'
require_relative '../../route'

describe Route do
  let(:train63) { Train.new(63, 'pass', 1) }
  let(:station1) { Station.new('Kharkov') }
  let(:station2) { Station.new('Poltava') }
  let(:station3) { Station.new('Mirgorod') }
  let(:station4) { Station.new('Darnica') }
  let(:station5) { Station.new('Kiev') }
  let(:route) { Route.new(station1, station2, station3, station4, station5) }

  describe 'speed_up' do
    it 'speed_up' do
      expect { train63.speed_up }.to change { train63.instance_variable_get(:@train_speed) }.from(0).to(20)
      expect { train63.speed_up }.to change { train63.instance_variable_get(:@train_speed) }.from(20).to(40)
    end

    it 'speed_up indicating speed' do
      expect { train63.speed_up(30) }.to change { train63.instance_variable_get(:@train_speed) }.from(0).to(30)
      expect { train63.speed_up(25) }.to change { train63.instance_variable_get(:@train_speed) }.from(30).to(55)
    end
  end

  describe 'speed_slow' do
    it 'speed_slow' do
      expect { train63.speed_up }.to change { train63.instance_variable_get(:@train_speed) }.from(0).to(20)
      expect { train63.speed_slow }.to change { train63.instance_variable_get(:@train_speed) }.from(20).to(0)
      expect { train63.speed_slow }.to change { train63.instance_variable_get(:@train_speed) }.by(0)
    end

    it 'speed_slow indicating speed' do
      expect { train63.speed_up(30) }.to change { train63.instance_variable_get(:@train_speed) }.from(0).to(30)
      expect { train63.speed_slow(30) }.to change { train63.instance_variable_get(:@train_speed) }.from(30).to(0)
      expect { train63.speed_slow(25) }.to change { train63.instance_variable_get(:@train_speed) }.by(0)
    end
  end

  describe 'cars_hook' do
    it 'cars_hook' do
      expect { train63.cars_hook }.to change { train63.instance_variable_get(:@train_cars_number) }.from(1).to(2)
      expect { train63.cars_hook }.to change { train63.instance_variable_get(:@train_cars_number) }.from(2).to(3)
    end

    it 'cars_hook with quantity' do
      expect { train63.cars_hook(10) }.to change { train63.instance_variable_get(:@train_cars_number) }.from(1).to(11)
      expect { train63.cars_hook(2) }.to change { train63.instance_variable_get(:@train_cars_number) }.from(11).to(13)
    end
  end

  describe 'cars_unhook' do
    it 'cars_unhook' do
      expect { train63.cars_unhook }.to change { train63.instance_variable_get(:@train_cars_number) }.from(1).to(0)
      expect { train63.cars_unhook }.to change { train63.instance_variable_get(:@train_cars_number) }.by(0)
    end

    it 'cars_unhook with quantity' do
      expect { train63.cars_hook(10) }.to change { train63.instance_variable_get(:@train_cars_number) }.from(1).to(11)
      expect { train63.cars_unhook(11) }.to change { train63.instance_variable_get(:@train_cars_number) }.from(11).to(0)
      expect { train63.cars_unhook(2) }.to change { train63.instance_variable_get(:@train_cars_number) }.by(0)
    end
  end

  describe 'route_add' do
    it 'route_add' do
      expect { train63.route_add(route) }.to change { train63.instance_variable_get(:@train_route) }.from(nil).to(route)
    end

    it 'route_add with the departure station' do
      expect { train63.route_add(route, station3) }.to change { train63.instance_variable_get(:@train_route) }.from(nil).to(route)
    end

    it 'route_add with initial station' do
      expect { train63.route_add(route, station3) }.to change { train63.instance_variable_get(:@current_station) }.from(nil).to(station3)
    end

    it 'route_add default starting station' do
      expect { train63.route_add(route) }.to change { train63.instance_variable_get(:@current_station) }.from(nil).to(station1)
    end
  end

  describe 'route_next' do
    it 'route_next' do
      expect { train63.route_add(route) }.to change { train63.instance_variable_get(:@train_route) }.from(nil).to(route)
      expect { train63.route_next }.to change { train63.instance_variable_get(:@current_station) }.from(station1).to(station2)
      expect { train63.route_next }.to change { train63.instance_variable_get(:@current_station) }.from(station2).to(station3)
      expect { train63.route_next }.to change { train63.instance_variable_get(:@current_station) }.from(station3).to(station4)
      expect { train63.route_next }.to change { train63.instance_variable_get(:@current_station) }.from(station4).to(station5)
    end
  end
end
