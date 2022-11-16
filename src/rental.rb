class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @book = book
    book.rentals.push(self)
    @person = person
    person.rentals.push(self)
    @date = date
  end
end
