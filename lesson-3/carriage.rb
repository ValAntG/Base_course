class Carriage
  attr_reader :carriage_type, :space_free

  include CompanyName

  def initialize(carriage_type, space)
    @carriage_type = carriage_type
    @space = space
    @space_free = space
  end

  def take_space(quantity)
    @space_free -= quantity if quantity <= @space_free
  end

  def space_booked
    @space - @space_free
  end
end
