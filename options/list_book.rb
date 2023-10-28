module ListBooks
  def list_books
    puts "\nBOOKS LIST:\n"
    if @books.empty?
      puts 'No books found'
    else
      @books.each_with_index do |book, i|
        puts "#{i + 1}) Published on #{book.publish_date}, Publish Date: #{book.publisher}, " \
             "Cover State: #{book.cover_state}, Genre: #{book.genre&.name}, Label: #{book.label&.title} " \
             "Author: #{book.author&.first_name} #{book.author&.last_name}"
      end
    end
  end
end
