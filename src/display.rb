require './database_load'
require './database_save'

class Display
  def menu
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def show_menu(app)
    load_database(app)
    loop do
      menu
      option = gets.chomp
      case option
      when '1'
        app.list_all_books
      when '2'
        app.list_all_people
      when '3'
        app.create_person
      when '4'
        app.create_book
      when '5'
        app.create_rental
      when '6'
        app.list_rentals
      when '7'
        save_database(app)
        break
      else
        puts 'That is not a valid option'
      end
    end
  end
end
