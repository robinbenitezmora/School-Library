require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './classroom'

class App
  def list_all_books(db_books)
    puts 'List of all books:'
    db_books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_book(db_books)
    print 'Please enter the title of the book:'
    title = gets.chomp
    print 'Please enter the author of the book:'
    author = gets.chomp
    db_books.push(Book.new(title, author))
    print 'Book created successfully'
  end

  def list_all_people(db_people)
    puts 'List of all people:'
    db_people.each { |person| puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person(db_people)
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    case option
    when '1'
      create_student(db_people, name, age)
    when '2'
      create_teacher(db_people, name, age)
    else
      puts 'That is not a valid input'
    end
  end

  def create_student(db_people, name, age)
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase
    student = ''
    case parent_permission
    when 'y'
      student = Student.new(age, name, parent_permission: true)
    when 'n'
      student = Student.new(age, name, parent_permission: false)
    else
      puts 'That is not a valid input'
      return
    end
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

  def list_rentals(db_people)
    if db_people.empty?
      puts 'There are no people to list rentals'
      return
    end

    puts 'Please enter the ID of the person whose rentals you want to see'
    id = gets.chomp.to_i

    user = db_people.find { |person| person.id == id }
    puts 'Rentals:'
    user.rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
