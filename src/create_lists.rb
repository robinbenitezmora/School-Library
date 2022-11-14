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
