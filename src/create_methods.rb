require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class CreatorMethods
  def create_person
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

  def create_book(db_books)
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    db_books.push(book)
    puts 'Book created successfully'
  end

