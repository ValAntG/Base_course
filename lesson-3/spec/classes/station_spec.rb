require_relative '../spec_helper'

describe Station do
  let(:train63) { Train.new(63, 'pass', 1) }
  let(:train64) { Train.new(64, 'pass', 18) }
  let(:train60) { Train.new(60, 'pass', 16) }
  let(:station) { Station.new('Kharkov') }

  describe '#train_arrival' do
    it 'the train should go from the station' do
      expect { station.train_arrival(train63) }
        .to change { station.instance_variable_get(:@station_trains) }.from([]).to([train63])
    end

    it 'one more train should be added to the train list at the station' do
      station.train_arrival(train63)
      expect { station.train_arrival(train64) }
        .to change { station.instance_variable_get(:@station_trains) }.from([train63]).to([train63, train64])
    end
  end

  describe '#train_departure' do
    it 'the train should go from the station' do
      station.train_arrival(train63)
      expect { station.train_departure(train63) }
        .to change { station.instance_variable_get(:@station_trains) }.from([train63]).to([])
    end
  end
end
