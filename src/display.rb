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
    loop do
      menu
      input = gets.chomp.to_i
      case input
      when 1 then app.list_all_books
      when 2 then app.list_all_people
      when 3 then app.create_person
      when 4 then app.create_book
      when 5 then app.create_rental
      when 6 then app.list_rentals
      when 7 then puts 'Thank you for using this app'
                  break
      else
        puts 'That is not a valid input'
      end
    end
  end
end
