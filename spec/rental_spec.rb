require_relative '../src/rental'
require_relative '../src/person'
require_relative '../src/book'

describe Rental do
  context 'should create an instance of Rental' do
    it 'should return true for book' do
      book = Book.new('Title', 'Author')
      expect(book).to be_an_instance_of(Book)
    end

    it 'should return true for person' do
      person = Person.new('Name', 20, parent_permission: true)
      expect(person).to be_an_instance_of(Person)
    end

    it 'should return true for rental' do
      book = Book.new('Title', 'Author')
      person = Person.new('Name', 20, parent_permission: true)
      rental = Rental.new('2020-01-01', book, person)
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'should return true for date' do
      book = Book.new('Title', 'Author')
      person = Person.new('Name', 20, parent_permission: true)
      rental = Rental.new('2020-01-01', book, person)
      expect(rental.date).to eq('2020-01-01')
    end
  end
end
