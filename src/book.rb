class Book 
  attr_accessor :date
  attr_accessor :title

  def initialize(title, date)
    @title = title
    @date = date
  end
end
