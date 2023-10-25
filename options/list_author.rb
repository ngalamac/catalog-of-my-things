module ListAuthors
  def list_authors
    puts "\nAUTHORS LIST:\n"
    if @authors.empty?
      puts 'No authors found'
    else
      @authors.each_with_index do |author, i|
        puts "#{i + 1}) ID: #{author.id}, Name: #{author.first_name} #{author.last_name}"
      end
    end
  end
end
