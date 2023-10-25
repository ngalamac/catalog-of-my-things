module ListMusicAlbums
  def list_music_albums
    puts "\nALBUMS LIST:\n"
    if @music_albums.empty?
      puts 'No music albums available.'
    else
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1}. Published on #{album.publish_date}, " \
             "#{album.on_spotify ? 'Available on Spotify' : 'Not available on Spotify'}, " \
             "Genre: #{album.genre.name}, Label: #{album.label.title} " \
             "Author: #{album.author.first_name} #{album.author.last_name}"
      end
    end
  end
end
