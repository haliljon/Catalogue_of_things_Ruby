require_relative '../item'

class Movie < Item
  attr_reader :id, :publish_date, :archived
  attr_accessor :silet, :source

  def initialize(id, publish_date, _archived, silet, source)
    super(id, publish_date, archived: false)
    @silet = silet
    @source = source
  end

  def can_be_archived?
    super || silet == true
  end

  def to_json(*args)
    {
      'publish_date' => @publish_date,
      'archived' => @archived,
      'silet' => @silet,
      'source' => @source
    }.to_json(*args)
  end
end
