class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @name = nameable
  end

  def correct_name
    @name.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @name.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    if @name.correct_name.length <= 10
      @name.correct_name
    else
      @name.correct_name[0..9]
    end
  end
end
