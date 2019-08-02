class TrainPass < Train
  validate(:name, :format, '\A[a-zA-Z0-9]{3}(-| )[a-zA-Z0-9]{2}\z')
  validate(:train_speed, :type, Integer)
  validate(:current_station, :type, Station, NilClass)

  def initialize(train_name)
    super
    @train_type = 'pass'
  end
end
