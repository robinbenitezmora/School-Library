require_relative './person'
require_relative './rental'

class Book
  attr_accessor :date, :title, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = nil
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
end
