require 'json'

module StoreData
  def save_all_files
    save_games
    save_labels
    save_albums
    save_books
    save_authors
    save_genres
  end

  def save_authors
    author_data = @authors.map do |author|
      {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    File.write('./storage/authors.json', JSON.pretty_generate(author_data))
  end

  def save_games
    games_data = @games.map do |game|
      label_id = game.label&.id

      {
        'multiplayer' => game.multiplayer,
        'last_played_at' => game.last_played_at.to_s,
        'publish_date' => game.publish_date.to_s,
        'archived' => game.archived,
        'label' => {
          'id' => label_id, # Handle nil label gracefully
          'title' => game.label&.title, # Access label title safely
          'color' => game.label&.color # Access label color safely
        }
      }
    end

    File.open('./storage/games.json', 'w') do |file|
      file.puts JSON.pretty_generate(games_data)
    end
  end

  def save_albums
    all_music_albums = @music_albums.map do |album|
      {
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        genre_name: album.genre&.name,
        archived: album.archived,
        label: album.label.nil? ? nil : { id: album.label.id },
        genre: album.genre.nil? ? nil : { id: album.genre.id },
        author: album.author.nil? ? nil : { id: album.author.id }
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

  def save_books
    books_json = @books.map do |book|
      {
        publisher: book.publisher,
        cover_state: book.cover_state,
        publish_date: book.publish_date,
        archived: book.archived,
        label: book.label.nil? ? nil : { id: book.label.id },
        genre: book.genre.nil? ? nil : { id: book.genre.id },
        author: book.author.nil? ? nil : { id: book.author.id }
      }
    end
    File.write('./storage/books.json', JSON.pretty_generate(books_json))
  end

  def save_labels
    labels_json = @labels.map do |label|
      {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end
    File.write('./storage/labels.json', JSON.pretty_generate(labels_json))
  end
end
