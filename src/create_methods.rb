require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class CreatorMethods
  def create_person(db_people)
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    case person_type
    when '1'
      create_student(db_people, name, age)
    when '2'
      create_teacher(db_people, name, age)
    else
      puts 'Invalid option'
    end
  end

  def create_student(db_people, name, age)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase
    parent_permission = parent_permission == 'y' ? true : false

    student = Student.new(age, name, parent_permission: parent_permission)
    db_people.push(student)
    puts 'Student created successfully'
  end

  def create_teacher(db_people, name, age)
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    db_people.push(teacher)
    puts 'Teacher created successfully'
  end
  
  def create_book(db_books)
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    db_books.push(book)
    puts 'Book created successfully'
  end

  def create_rental(db_books, db_people)
    puts 'Select a book from the following list by number'
    db_books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts

    puts 'Select a person from the following list by number'
    db_people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    puts

    print 'Date (yyyy-mm-dd): '
    date = gets.chomp

    rental = Rental.new(date, db_books[book_index], db_people[person_index])
    puts "Rental created successfully for #{db_people[person_index].name}"
  end
end

