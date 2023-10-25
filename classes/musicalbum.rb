require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, archived: false)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super_result = super
    puts "In MusicAlbum: super: #{super_result} @on_spotify: #{@on_spotify} result: #{super_result && @on_spotify}"
    super_result && @on_spotify
  end
end
