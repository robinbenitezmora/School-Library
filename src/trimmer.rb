require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    if @name.correct_name.length <= 10
      @name.correct_name
    else
      @name.correct_name[0..9]
    end
  end
end
