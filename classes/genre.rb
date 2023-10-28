require_relative 'item'

class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name, id = Random.rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
