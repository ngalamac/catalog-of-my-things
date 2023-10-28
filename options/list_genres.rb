module ListGenres
  def list_genres
    puts "\nGENRES LIST:\n"
    if @genres.empty?
      puts 'No genres available.'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
    end
  end
end
