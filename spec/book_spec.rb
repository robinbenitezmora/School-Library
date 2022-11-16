require_relative '../src/book'

describe Book do
  context 'when initialized' do
    book = Book.new('The Hobbit', 'J.R.R. Tolkien')

    it 'takes two parameters and returns a Book object' do
      expect(book).to be_an_instance_of(Book)
    end
  end
end
