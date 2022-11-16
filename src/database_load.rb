require 'json'

def load_database(app)
  load_people(app)
  load_books(app)
  load_rentals(app)
end

def load_people(app)
  File.write('people.json', JSON.generate([])) unless File.exist?('people.json')
  people = JSON.parse(File.read('people.json'))
  people.each do |person|
    case person['type']
    when 'Student'
      student = Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
      app.people.push(student)
    when 'Teacher'
      teacher = Teacher.new(person['specialization'], person['age'], person['name'])
      app.people.push(teacher)
    end
  end
end

def load_books(app)
  File.write('books.json', JSON.generate([])) unless File.exist?('books.json')
  books = JSON.parse(File.read('books.json'))
  books.each do |book|
    book = Book.new(book['title'], book['author'])
    app.books.push(book)
  end
end

def load_rentals(app)
  File.write('rentals.json', JSON.generate([])) unless File.exist?('rentals.json')
  rentals = JSON.parse(File.read('rentals.json'))
  rentals.each do |rental|
    rental = Rental.new(rental['date'], rental['book'], rental['person'])
    app.rentals.push(rental)
  end
end
