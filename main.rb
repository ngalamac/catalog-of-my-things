require './app'

def show_options
  puts "\nPlease choose an option by entering a number:
1 - List all books
2 - List all music albums
3 - List of games
4 - List all genres
5 - List all labels
6 - List all authors
7 - Add a book
8 - Add a music album
9 - Add a game
0 - Exit"
end

def main
  app = App.new
  puts "Welcome to 'Catalog of my things' App!"
  show_options
  loop do
    option = gets.chomp
    option = option.to_i if option =~ /^\d+$/
    if (0..12).include?(option)
      app.call_option(option)
      break if option.zero?

      show_options
    else
      puts "\nChoose a number between 0 and 12"
    end
  end
end

main
