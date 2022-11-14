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

  def create_rental(db_data) # rubocop:todo Metrics/MethodLength
    if db_data[:books].empty?
      puts 'There are no books to rent'
      return
    end
    if db_data[:people].empty?
      puts 'There are no people to rent books to'
      return
    end

    puts 'Select a book from the following list by number'
    db_data[:books].each_with_index { |book, index| puts "#{index} Title: \"#{book.title}\", Author: #{book.author}" }

    book_index = gets.chomp.to_i
    book_chosen = db_data[:books][book_index]

    puts 'Select a person from the following list by number'
    db_data[:people].each_with_index do |person, index|
      puts "#{index} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i
    person_chosen = db_data[:people][person_index]

    puts 'Date: yyyy-mm-dd'
    date = gets.chomp

    person_chosen.add_rental(book_chosen, date)
    puts "Rental created successfully for #{person_chosen.name} with #{book_chosen.title}"
  end
end
