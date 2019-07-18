require_relative '../spec_helper'

describe Route do
  let(:station1) { Station.new('Kharkov') }
  let(:station2) { Station.new('Poltava') }
  let(:station3) { Station.new('Mirgorod') }
  let(:station4) { Station.new('Darnica') }
  let(:station5) { Station.new('Kiev') }
  let(:route) { Route.new(station1, station2, station3, station5) }

  describe '#add_station' do
    it 'should add a station to the route' do
      expect { route.add_station(station4) }.to change { route.route_stations[-2] }.from(station3).to(station4)
    end

    it 'station should be added to the route indicating the position of the place in the route' do
      expect { route.add_station(station4, 2) }.to change { route.route_stations[-3] }.from(station2).to(station4)
    end
  end

  describe 'del_station' do
    it 'station should be removed from the route' do
      expect { route.del_station(station3) }.to change { route.route_stations[2] }.from(station3).to(station5)
    end
  end
end
