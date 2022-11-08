require_relative './person'
require_relative './rental'

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(person, date, self)
  end
end
