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
end
