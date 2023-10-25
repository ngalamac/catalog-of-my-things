require 'date'

class Item
  attr_accessor :date, :publish_date
  attr_reader :id, :archived, :label, :author, :genre

  def initialize(publish_date, archived: false)
    @publish_date = begin
      (Date.parse(publish_date) if publish_date.is_a?(String))
    rescue Date::Error
      nil
    end

    @archived = archived
    @id = Random.rand(1...1000)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.nil? || genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.nil? || author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.nil? || label.items.include?(self)
  end

  def move_to_archive?
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end
end
