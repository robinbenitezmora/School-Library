require_relative 'create_lists'
require_relative 'create_methods'

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
  lists = Lists.new
  methods = CreatorMethods.new
  
  case display_menu
  when '1'
    lists.list_all_books(db_data[:books])
  when '2'
    lists.list_all_people(db_data[:people])
  when '3'
    methods.create_person(db_data[:people])
  when '4'
    methods.create_book(db_data[:books])
  when '5'
    methods.create_rental(db_data)
  when '6'
    lists.list_rentals(db_data[:people])
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
