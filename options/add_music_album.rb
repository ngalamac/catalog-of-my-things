
require './options/add_props'
require './classes/musicalbum'

module AddMusicAlbum
  include AddProps

 def add_music_album
    puts 'What is the title of the music album?'
    title = gets.chomp
  
    puts 'Who is the artist of the music album?'
    artist = gets.chomp
  
    puts 'What is the release date of the music album? (YYYY-MM-DD)'
    publish_date = gets.chomp
  
    puts 'What record label does the music album belong to?'
    label = gets.chomp
  
    album = MusicAlbum.new(title, artist, Date.parse(publish_date), label)
    @albums << album
  
    save_music_albums_json
  
    puts 'Music album created successfully!'
  end