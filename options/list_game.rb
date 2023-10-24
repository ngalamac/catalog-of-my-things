module ListGames
  def list_games
    puts "\nGAMES LIST:\n"
    if @games.empty?
      puts 'No games found'
    else
      @games.each_with_index do |game, i|
        last_played_date = game.last_played_at
        puts "#{i + 1}) Last Played on #{last_played_date}, Publish Date: #{game.publish_date}, " \
             "Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}, Archived: #{game.archived}"
      end
    end
  end
end
