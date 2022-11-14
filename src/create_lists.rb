require_relative 'book'
require_relative 'person'
require_relative 'rental'

class Lists
  def list_all_people(db_people)
    puts 'List of all people'
    db_people.each do |person|
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_all_books(db_books)
    puts 'List of all books'
    db_books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_rentals(db_people)
    #Please complete this method to list all rentals for a given person id
  end
end
