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
    puts 'Please enter the title of the book:'
    title = gets.chomp
    puts 'Please enter the author of the book:'
    author = gets.chomp
    db_books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def list_all_people(db_people)
    puts 'List of all people:'
    db_people.each { |person| puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person(db_people)
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    option = gets.chomp
    case option
    when '1'
      create_student(db_people)
    when '2'
      create_teacher(db_people)
    else
      puts 'That is not a valid input'
      return
    end
  end

  def create_student(db_people)
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'
    db_people.push(Student.new(age, name, parent_permission))
    puts 'Person created successfully'
  end

  def create_teacher(db_people)
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    db_people.push(Teacher.new(age, specialization, name))
    puts 'Person created successfully'
  end

  def create_rental(db_data)
    if db_data[:books].empty?
      puts 'There are no books to rent'
      return
    end
    if db_data[:people].empty?
      puts 'There are no people to rent books to'
      return
    end

    puts 'Select a book from the following list by number'
    db_data[:books].each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }

    book_index = gets.chomp.to_i
    book_chosen = db_data[:books][book_index]

    puts 'Select a person from the following list by number (not id)'
    db_data[:people].each_with_index { |person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }

    person_index = gets.chomp.to_i
    person_chosen = db_data[:people][person_index]

    puts 'Date: yyyy-mm-dd'
    date = gets.chomp

    person_chosen.add_rental(date, book_chosen)
    puts 'Rental created successfully'
  end

  def list_rentals(db_people)
    if db_people.empty?
      puts 'There are no people to list rentals for'
      return
    end

    puts 'ID of person:'
    person_id = gets.chomp.to_i
    person_fetch = db_people.find { |person| person.id == person_id }

    #this can change to a method in the person class

   if person_fetch[0]&.id == person_id
      puts 'Rentals:'
      person_fetch[0].rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'That person doesn\'t exist'
    end
  end
end
