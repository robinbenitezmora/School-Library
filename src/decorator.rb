require_relative './nameable'

class Decorator < Nameable
  attr_accessor :nameable
  
  def initialize(nameable)
    super()
    @name = nameable
  end

  def correct_name
    @name.correct_name
  end
end
