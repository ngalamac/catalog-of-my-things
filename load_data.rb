require 'json'

module LoadData
  def load_all_files
    load_authors
    load_games
    load_albums
    load_genres
    load_books
    load_labels
  end

  def load_authors
    return unless File.exist?('./storage/authors.json')

    authors_json = JSON.parse(File.read('./storage/authors.json'))
    @authors = authors_json.map do |author|
      # Use the fetch method to handle missing or nil values
      first_name = author.fetch('first_name', '')
      last_name = author.fetch('last_name', '')
      id = author.fetch('id', nil)

      Author.new(first_name, last_name, id)
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

  def load_albums
    return unless File.exist?('./storage/musicalbum.json')

    musicalbums_loaded = JSON.parse(File.read('./storage/musicalbum.json'))
    @music_albums = musicalbums_loaded.map do |album|
      album_obj = MusicAlbum.new(album['publish_date'], album['on_spotify'], archived: album['archived'])
      album_obj.genre = @genres.find { |g| g.id == album['genre']['id'] }
      album_obj.label = @labels.find { |l| l.id == album['label']['id'] }
      album_obj.author = @authors.find { |a| a.id == album['author']['id'] } if album['author']

      album_obj
    end
  end

  def load_genres
    return unless File.exist?('./storage/genres.json')

    genres_loaded = JSON.parse(File.read('./storage/genres.json'))
    @genres = genres_loaded.map do |genre|
      Genre.new(genre['name'], genre['id'])
    end
  end

  def load_books
    return unless File.exist?('./storage/books.json')

    books_json = JSON.parse(File.read('./storage/books.json'))
    @books = books_json.map do |book|
      book_obj = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
      book_obj.genre = @genres.find { |g| g.id == book['genre']['id'] } if book['genre']
      book_obj.label = @labels.find { |l| l.id == book['label']['id'] } if book['label']
      book_obj.author = @authors.find { |a| a.id == book['author']['id'] } if book['author']
      book_obj
    end
  end

  def load_labels
    return unless File.exist?('./storage/labels.json')

    labels_json = JSON.parse(File.read('./storage/labels.json'))
    @labels = labels_json.map do |label|
      Label.new(label['title'], label['color'], label['id'])
    end
  end
end
