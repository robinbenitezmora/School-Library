require_relative './app'

db = { books: [], people: [] }

puts 'Welcome to School Library App!'

def display_menu
  puts
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

# rubocop:todo Metrics/MethodLength
def main(db_data) # rubocop:todo Metrics/CyclomaticComplexity, Metrics/MethodLength
  app = App.new
  case display_menu
  when '1'
    app.list_all_books(db_data[:books])
  when '2'
    app.list_all_people(db_data[:people])
  when '3'
    app.create_person(db_data[:people])
  when '4'
    app.create_book(db_data[:books])
  when '5'
    app.create_renta(db_data)
  when '6'
    app.list_rentals(db_data[:people])
  when '7'
    puts 'Thank you for using this app!'
    return
  else
    puts 'That is not a valid option'
  end
  main(db_data)
end
# rubocop:enable Metrics/MethodLength

main(db)

# When I try to check the rentals for a person,
# I get a error message that says "undefined method `rentals' for nil:NilClass"
# I don't know why this is happening, I have tried to debug it but I can't find the problem.
