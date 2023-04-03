require_relative '../item'

class Game < Item
  attr_reader :id, :publish_date, :archived
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, publish_date, archived, multiplayer, last_played_at)
    super(id, publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    # @author = author
  end

  def can_be_archived?
    super && @last_played_at > 2.years.ago
  end

  def to_json(*args)
    {
      'publish_date' => @publish_date,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
      # 'author' => @author
    }.to_json(*args)
  end
end
