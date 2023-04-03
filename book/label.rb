class Label
  attr_reader :items, :id
  attr_accessor :title, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_json(*_args)
    {
      title: @title,
      color: @color,
      items: @items
    }.to_json(*_args)
  end
end
