class TrainCargo < Train
  def initialize(train_name)
    super
    @train_type = 'cargo'
  end
end
