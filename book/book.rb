require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :id, :publish_date, :archived

  def initialize(id, publish_date, archived, publisher, cover_state)
    super(id, publish_date, archived: false)
    @publisher = publisher
    @cover_state = cover_state
    # @label = label
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def to_json(*args)
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end
end
