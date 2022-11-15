require 'json'

def load_database(app)
  load_people(app)
  load_books(app)
  load_rentals(app)
end

def load_people(app)
  File.write('people.json', JSON.generate(app.people)) if File.exist?('people.json')
  people = JSON.parse(File.read('people.json'))
  people.each do |person|
    if person['class'] == 'Student'
      student = Student.new(person['id'], person['name'], person['age'], person['parent_permission'])
      app.people.push(student)
    elsif person['class'] == 'Teacher'
      teacher = Teacher.new(person['id'], person['name'], person['age'], person['specialization'])
      app.people.push(teacher)
    end
  end
end

def load_books(app)
  File.write('books.json', JSON.generate(app.books)) if File.exist?('books.json')
  books = JSON.parse(File.read('books.json'))
  books.each do |book|
    book = Book.new(book['id'], book['title'], book['author'])
    app.books.push(book)
  end
end

def load_rentals(app)
  File.write('rentals.json', JSON.generate(app.rentals)) if File.exist?('rentals.json')
  rentals = JSON.parse(File.read('rentals.json'))
  rentals.each do |rental|
    rental = Rental.new(rental['id'], rental['date'], rental['person'], rental['book'])
    app.rentals.push(rental)
  end
end
