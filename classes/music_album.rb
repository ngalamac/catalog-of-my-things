require '../item'

class MusicAlbum < Item
  attr_accessor :title, :artist, :release_date, :label, :on_spotify

  def initialize(title, artist, publish_date, label)
    super(publish_date)
    @title = title
    @artist = artist
    @publish_date = publish_date
    @label = label
    @on_spotify = false
  end

  def can_be_archived?
    super && @on_spotify
  end
end

