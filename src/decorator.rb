require_relative './nameable'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @name = nameable
  end

  def correct_name
    @name.correct_name
  end
end
