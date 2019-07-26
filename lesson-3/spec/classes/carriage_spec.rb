require_relative '../spec_helper'

describe Station do
  let(:train63) { TrainPass.new('630-01') }
  let(:train1) { TrainCargo.new('630-01') }

  describe '#Carriage@carriage_type' do
    it 'should the type of passenger carriage correspond to the passenger train' do
      expect { train63.carriages_hook(10) }
        .to change { train63.train_carriages[0].instance_variable_get(:@carriage_type) }.from(nil).to('pass')
    end

    it 'should the type of passenger carriage correspond to the cargo train' do
      expect { train1.carriages_hook(10) }
        .to change { train1.train_carriages[0].instance_variable_get(:@carriage_type) }.from(nil).to('cargo')
    end
  end

  describe '#Carriage@space' do
    it 'should be added to the capacity of the car when you create a carriage' do
      expect { train63.carriages_hook(10) }
        .to change { train63.train_carriages[0].instance_variable_get(:@space) }.from(nil).to(10)
    end
  end

  describe '#take_space' do
    it 'the free seat in the passenger carriage should decrease by one seat' do
      train63.carriages_hook(2)
      expect { train63.train_carriages[0].take_space(1) }
        .to change { train63.train_carriages[0].instance_variable_get(:@space_free) }.from(2).to(1)
    end

    it 'the empty seat in the freight carriage should decrease by 10 units' do
      train1.carriages_hook(20)
      expect { train1.train_carriages[0].take_space(10) }
        .to change { train1.train_carriages[0].instance_variable_get(:@space_free) }.from(20).to(10)
    end

    it 'the free space in the freight carriage should not change when you try to load more into it' do
      train1.carriages_hook(20)
      expect { train1.train_carriages[0].take_space(30) }
        .to change { train1.train_carriages[0].instance_variable_get(:@space_free) }.by(0)
    end
  end

  describe '#space_booked' do
    it 'should be added to the capacity of the car when you create a carriage' do
      train1.carriages_hook(20)
      expect { train1.train_carriages[0].take_space(5) }.to change { train1.train_carriages[0].space_booked }
        .from(0).to(5)
    end
  end
end
