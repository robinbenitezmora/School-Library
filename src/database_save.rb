requier 'json'

def save_database(app)
  save_people(app)
  save_books(app)
  save_rentals(app)
end

def save_people(app)
  people = []
  app.people.each do |person|
    if person.class.to_s == 'Student'
      student = { 'id' => person.id, 'name' => person.name, 'age' => person.age, 'parent_permission' => person.parent_permission, 'class' => person.class.to_s }
      people.push(student)
    elsif person.class.to_s == 'Teacher'
      teacher = { 'id' => person.id, 'name' => person.name, 'age' => person.age, 'specialization' => person.specialization, 'class' => person.class.to_s }
      people.push(teacher)
    end
  end
  File.write('people.json', JSON.generate(people))
end

def save_books(app)
  books = []
  app.books.each do |book|
    book = { 'id' => book.id, 'title' => book.title, 'author' => book.author }
    books.push(book)
  end
  File.write('books.json', JSON.generate(books))
end

def save_rentals(app)
  rentals = []
  app.rentals.each do |rental|
    rental = { 'id' => rental.id, 'date' => rental.date, 'person' => rental.person, 'book' => rental.book }
    rentals.push(rental)
  end
  File.write('rentals.json', JSON.generate(rentals))
end
