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

def save_albums
  all_music_albums = @music_albums.map do |album|
    {
      publish_date: album.publish_date,
      on_spotify: album.on_spotify,
      genre_name: album.genre.name,
      archived: album.archived,
      label: {
        id: album.label.id
      },
      genre: {
        id: album.genre.id
      },
      author: {
        id: album.author.id
      }
    }
  end
  File.write('./storage/musicalbum.json', JSON.pretty_generate(all_music_albums))
end

def save_genres
  all_genres = @genres.map do |genre|
    { id: genre.id, name: genre.name }
  end
  File.write('./storage/genres.json', JSON.pretty_generate(all_genres))
end

