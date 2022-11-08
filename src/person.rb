require_relative './nameable'
require_relative './capitalize'
require_relative './trimmer'
require_relative './rental'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rental = nil
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private :of_age?
end

# Try the following code:
person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmer_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmer_person.correct_name
