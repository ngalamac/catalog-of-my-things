require './classes/genre'
require './classes/item'


def list_genres
  @genres.each do |genre|
    puts '------------------------------'
    puts "Genre: #{genre.name}"
    puts 'Items:'
    genre.items.each do |item|
      if item.is_a?(Book)
        puts "- Book: #{item.publisher} (#{item.publish_date})"
      elsif item.is_a?(MusicAlbum)
        puts "- Music Album: #{item.title} by #{item.artist} (#{item.release_date})"
      end
    end
    puts '------------------------------'
  end
end