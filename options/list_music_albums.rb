require './classes/music_album'
require './classes/label'

def list_music_albums
    @albums.each do |album|
      puts '------------------------------'
      puts "Title: #{album.title}"
      puts "Artist: #{album.artist}"
      puts "Publish Date: #{album.publish_date}"
      puts "Record Label: #{album.label}"
      puts '------------------------------'
    end
  end