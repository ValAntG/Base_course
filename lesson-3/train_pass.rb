class TrainPass < Train
  def initialize(train_name)
    super
    @train_type = 'pass'
  end
end
