require 'json'

module StoreData
  def save_all_files
    save_games
    save_labels
  end


  def save_authors
    labels_json = @labels.map do |label|
      {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end
    File.write('./storage/labels.json', JSON.pretty_generate(labels_json))
  end

  def save_games
    games_json = @games.map do |game|
      {
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        publish_date: game.publish_date,
        archived: game.archived,
        label: {
          id: game.label.id
        }
      }
    end
    File.write('./storage/games.json', JSON.pretty_generate(games_json))
  end

end
