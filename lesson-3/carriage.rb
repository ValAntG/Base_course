class Carriage
  attr_reader :carriage_type
  include CompanyName
  def initialize(carriage_type)
    @carriage_type = carriage_type
  end
end
