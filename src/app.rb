require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './classroom'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_book
    print 'Please enter the title of the book:'
    title = gets.chomp
    print 'Please enter the author of the book:'
    author = gets.chomp
    @books.push(Book.new(title, author))
    print 'Book created successfully'
  end

  def list_all_people
    puts 'List of all people:'
    @people.each { |person| puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    case option
    when '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      student = Student.new(age, name, parent_permission)
      @people.push(student)
      print 'Student created successfully'

    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @people.push(teacher)
      print 'Teacher created successfully'
    else
      puts 'That is not a valid input'
      nil
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index} Title: \"#{book.title}\", Author: #{book.author}" }

    book_index = gets.chomp.to_i
    book_chosen = @books[book_index]

    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) [Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i
    person_chosen = @people[person_index]

    puts 'Date: yyyy-mm-dd'
    date = gets.chomp

    person_chosen.add_rental(book_chosen, date)
    puts "Rental created successfully for #{person_chosen.name} with #{book_chosen.title}"
  end

  def list_rentals
    puts 'Please enter the ID of the person whose rentals you want to see'
    id = gets.chomp.to_i

    user = @people.find { |person| person.id == id }
    if user.nil?
      puts 'No person found with that ID'
    elsif user.rentals.empty?
      puts 'No rentals found for that person'
    else
      puts 'Rentals:'
      user.rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
