class Source
  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_json(*args)
    {
      'id' => @id,
      'name' => @name,
      'items' => @items
    }.to_json(*args)
  end
end
