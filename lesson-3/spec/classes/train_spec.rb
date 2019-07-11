require_relative '../spec_helper'

describe Train do
  let(:train63) { Train.new(63) }
  let(:station1) { Station.new('Kharkov') }
  let(:station2) { Station.new('Poltava') }
  let(:station3) { Station.new('Mirgorod') }
  let(:station4) { Station.new('Darnica') }
  let(:station5) { Station.new('Kiev') }
  let(:route) { Route.new(station1, station2, station3, station4, station5) }

  describe '#speed_up' do
    it 'should raise the speed of the train to the standard value' do
      expect { train63.speed_up }.to change { train63.instance_variable_get(:@train_speed) }.from(0).to(20)
    end

    it 'should raise the trains speed to any value' do
      expect { train63.speed_up(30) }.to change { train63.instance_variable_get(:@train_speed) }.from(0).to(30)
    end
  end

  describe '#speed_slow' do
    it 'should reduce the train speed by a standard value' do
      train63.speed_up
      expect { train63.speed_slow }.to change { train63.instance_variable_get(:@train_speed) }.from(20).to(0)
    end

    it 'should not reduce speed to standard value when speed is 0' do
      expect { train63.speed_slow }.to change { train63.instance_variable_get(:@train_speed) }.by(0)
    end

    it 'should reduce the train speed to any value' do
      train63.speed_up(30)
      expect { train63.speed_slow(30) }.to change { train63.instance_variable_get(:@train_speed) }.from(30).to(0)
    end

    it 'should not reduce speed by a variable value when speed is 0' do
      expect { train63.speed_slow(25) }.to change { train63.instance_variable_get(:@train_speed) }.by(0)
    end
  end

  # describe '#carriages_hook' do
  #   it 'must attach a standard number of carriages' do
  #     expect { train63.carriages_hook }.to change { train63.instance_variable_get(:@train_carriages_number) }
  #       .from(1).to(2)
  #   end
  #
  #   it 'must attach a variable number of carriages' do
  #     expect { train63.carriages_hook(10) }.to change { train63.instance_variable_get(:@train_carriages_number) }
  #       .from(1).to(11)
  #   end
  #
  #   it 'wagons should not be attached when the train is moving' do
  #     train63.speed_up(30)
  #     expect { train63.carriages_hook(10) }.to change { train63.instance_variable_get(:@train_carriages_number) }
  #       .by(0)
  #   end
  # end

  # describe '#carriages_unhook' do
  #   it 'must unhook the standard number of carriages' do
  #     expect { train63.carriages_unhook }.to change { train63.instance_variable_get(:@train_carriages_number) }
  #       .from(1).to(0)
  #   end
  #
  #   it 'should not detach the standard number of carriages when the number of carriages is already 0' do
  #     train63.carriages_unhook
  #     expect { train63.carriages_unhook }.to change { train63.instance_variable_get(:@train_carriages_number) }.by(0)
  #   end
  #
  #   it 'must unhook a variable number of carriages' do
  #     train63.carriages_hook(10)
  #     expect { train63.carriages_unhook(11) }.to change { train63.instance_variable_get(:@train_carriages_number) }
  #       .from(11).to(0)
  #   end
  #
  #   it 'should not disengage a variable number of carriages when the number of carriages is already 0' do
  #     train63.carriages_unhook
  #     expect { train63.carriages_unhook(2) }.to change { train63.instance_variable_get(:@train_carriages_number) }
  #       .by(0)
  #   end
  #
  #   it 'the car should not be uncoupled when the train is in motion' do
  #     train63.speed_up(30)
  #     expect { train63.carriages_unhook(1) }.to change { train63.instance_variable_get(:@train_carriages_number) }
  #       .by(0)
  #   end
  # end

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
end
