require_relative '../item'

class Book < Item
  attr_accessor :label, :publisher, :cover_state
  attr_reader :id, :publish_date, :archived

  def initialize(id, publish_date, archived, publisher, cover_state, label)
    super(id, publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def to_json(*args)
    {
      'publish_date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'label' => @label
    }.to_json(*args)
  end
end
