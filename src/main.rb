require_relative './app'

data = { books: [], people: [], rentals: [] }

puts 'Welcome to School Library your App!'

def menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  gets.chomp
end

def main_menu(db_data) # rubocop:todo Metrics/CyclomaticComplexity
  app = App.new
  case menu
  when '1'
    app.list_all_books(db_data[:books])
  when '2'
    app.list_all_people(db_data[:people])
  when '3'
    app.create_person(db_data[:people])
  when '4'
    app.create_book(db_data[:books])
  when '5'
    app.create_rental(db_data[:rentals], db_data[:books], db_data[:people])
  when '6'
    app.list_rentals_by_person_id(db_data[:rentals], db_data[:books], db_data[:people])
  when '7'
    puts 'Thank you for using this app!'
    break
  else
    puts 'That is not a valid option'
  end
end

main_menu(data)
