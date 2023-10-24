class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color)
    @id = Random.rand(1..500)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    raise ArgumentError, 'Only instances of the Item class can be added to the items array.' unless item.is_a?(Item)

    @items << item unless @items.include?(item)
    item.label = self
  end
end
