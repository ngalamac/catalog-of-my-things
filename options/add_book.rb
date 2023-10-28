require './classes/book'
require './classes/label'
require './options/list_label'
require './options/add_props'

module AddBook
  include AddProps

  def add_book
    puts 'The book was published by ...'
    publisher = gets.chomp.to_s
    puts "Describe a cover state of the book (e.g. 'good', 'bad')"
    cover_state = gets.chomp.to_s
    puts "When the book was published? Provide in format 'yyyy-mm-dd'"

    loop do
      @publish_date = gets.chomp
      break if @publish_date =~ /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/

      return if @publish_date == 'exit'

      puts "Provide the date in format 'yyyy-mm-dd' or type 'exit' to go to main menu"
    end

    book = Book.new(publisher, cover_state, @publish_date)
    @books.push(book)

    choose_label(book)
    choose_genre(book)
    choose_author(book)

    puts "Book created successfully!\n"
  end
end
