require_relative '../item'

class MusicAlbum < Item
    attr_accessor :on_spotify, :genre
    attr_reader :id, :publish_date, :archived

    def initialize(id, publish_date, archived, on_spotify, genre)
        super(id, publish_date, archived: false)
        @on_spotify = on_spotify
        @genre = genre
    end

    def can_be_archived?
        super && @on_spotify
    end

    def to_json(*args)
        {
            'publish_date' => @publish_date,
            'archived' => @archived,
            'on_spotify' => @on_spotify,
            'genre' => @genre
        }.to_json(*args)
    end 
end    