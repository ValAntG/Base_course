require_relative '../spec_helper'

describe Train do
  let(:train63) { TrainPass.new('630-01') }
  let(:station1) { Station.new('Kharkov') }
  let(:station2) { Station.new('Poltava') }
  let(:station3) { Station.new('Mirgorod') }
  let(:station4) { Station.new('Darnica') }
  let(:station5) { Station.new('Kiev') }
  let(:route) { Route.new('Stolishniy', [station1, station2, station3, station4, station5]) }

  describe '#speed_up' do
    it 'should raise the trains speed to any value' do
      expect { train63.speed_up(30) }.to change { train63.instance_variable_get(:@train_speed) }.from(0).to(30)
    end
  end

  describe '#speed_slow' do
    it 'should reduce the train speed by a standard value' do
      train63.speed_up(30)
      expect { train63.speed_slow(35) }.to change { train63.instance_variable_get(:@train_speed) }.from(30).to(0)
    end

    it 'should not reduce speed by a variable value when speed is 0' do
      expect { train63.speed_slow(30) }.to change { train63.instance_variable_get(:@train_speed) }.by(0)
    end
  end

  describe '#carriages_hook' do
    it 'should add carriage to train' do
      expect { train63.carriages_hook }.to change { train63.instance_variable_get(:@train_carriages).size }
        .from(0).to(1)
    end

    it 'should not add carriage to the train while driving' do
      train63.carriages_hook
      train63.speed_up(30)
      expect { train63.carriages_hook }.to change { train63.instance_variable_get(:@train_carriages).size }.by(0)
    end
  end

  describe '#carriages_unhook' do
    it 'should remove the carriage from the train' do
      train63.carriages_hook
      expect { train63.carriages_unhook }.to change { train63.instance_variable_get(:@train_carriages).size }
        .from(1).to(0)
    end

    it 'the carriage should not be unhooked if there are no cars already in the train' do
      expect { train63.carriages_unhook }.to change { train63.instance_variable_get(:@train_carriages).size }
        .by(0)
    end

    it 'should not remove the carriage from the train while driving' do
      train63.carriages_hook
      train63.speed_up(30)
      expect { train63.carriages_unhook }.to change { train63.instance_variable_get(:@train_carriages).size }.by(0)
    end
  end

  describe '#route_add' do
    it 'should add a route to the train' do
      expect { train63.route_add(route) }.to change { train63.instance_variable_get(:@train_route) }.from(nil).to(route)
    end

    it 'must add route indicating departure station' do
      expect { train63.route_add(route, station3) }
        .to change { train63.instance_variable_get(:@train_route) }.from(nil).to(route)
    end

    it 'must add a route indicating the departure station. Checks station initialization' do
      expect { train63.route_add(route, station3) }
        .to change { train63.instance_variable_get(:@current_station) }.from(nil).to(station3)
    end

    it 'must add a route from the standard departure station' do
      expect { train63.route_add(route) }
        .to change { train63.instance_variable_get(:@current_station) }.from(nil).to(station1)
    end
  end

  describe '#route_next' do
    it 'should follow the route to the next station' do
      expect { train63.route_add(route) }.to change { train63.instance_variable_get(:@train_route) }.from(nil).to(route)
      expect { train63.route_next }
        .to change { train63.instance_variable_get(:@current_station) }.from(station1).to(station2)
      train63.route_next
      train63.route_next
      expect { train63.route_next }
        .to change { train63.instance_variable_get(:@current_station) }.from(station4).to(station5)
    end
  end

  describe '#arrival' do
    it 'the current station should be added to the train' do
      expect { train63.arrival(station1) }.to change { train63.instance_variable_get(:@current_station) }.from(nil)
                                                                                                         .to(station1)
    end
  end
end
