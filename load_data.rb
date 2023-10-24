require 'json'

module LoadData
  def load_all_files
    load_authors
    load_games
  end

  def load_authors
    return unless File.exist?('./storage/authors.json')

    authors_json = JSON.parse(File.read('./storage/authors.json'))
    @authors = authors_json.map do |author|
      Author.new(author['first_name'], author['last_name'], author['id'])
    end
  end

  def load_games
    return unless File.exist?('./storage/games.json')

    games_json = JSON.parse(File.read('./storage/games.json'))
    @games = games_json.map do |game|
      game_obj = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'],
                          archived: game['archived'])
      game_obj.label = @labels.find { |l| l.id == game['label']['id'] }
      game_obj
    end
  end

end
