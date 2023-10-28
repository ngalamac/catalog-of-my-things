require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, archived: false)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    begin
      @last_played_at = Date.parse(last_played_at) if last_played_at.is_a?(String)
    rescue Date::Error
      @last_played_at = nil
    end
  end

  def can_be_archived?
    now = Time.now.utc.to_date
    add = if now.month > last_played_at.month || (now.month == last_played_at.month && now.day >= last_played_at.day)
            0
          else
            1
          end
    age = now.year - last_played_at.year - add
    super && (age > 2)
  end
end
