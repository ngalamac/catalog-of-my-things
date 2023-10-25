require './store_data'
require './load_data'

require './options/list_book'
require './options/list_label'
require './options/add_book'
require './options/list_genres'
require './options/list_music_albums'
require './options/add_musicalbum'
require './options/add_game'
require './options/list_game'
require './options/list_author'

class App
  include ListGames
  include ListAuthors
  include AddGame
  include AddMusicAlbum
  include ListMusicAlbums
  include ListGenres
  include AddBook
  include ListBooks
  include ListLabels

  include StoreData
  include LoadData

  OPTIONS_HASH = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_games,
    4 => :list_genres,
    5 => :list_labels,
    6 => :list_authors,
    7 => :add_book,
    8 => :add_music_album,
    9 => :add_game
  }.freeze

  attr_accessor :books, :music_albums, :games, :genres, :labels, :authors

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []

    load_all_files
  end

  def call_option(option)
    if option.zero?
      save_all_files
      puts 'Thank you for using our app!'
    else
      method(OPTIONS_HASH[option]).call
    end
  end
end
