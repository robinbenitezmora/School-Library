require './app'
require './display'

def main
  app = App.new
  display = Display.new
  puts 'Welcome to School Library App!'
  display.show_menu(app)
end

main
