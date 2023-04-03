require_relative 'data/save_data'
require_relative 'book/label'
require_relative 'book/book'
require_relative 'item'
require_relative 'music/genre'
require_relative 'music/music_album'
require_relative 'game/game'
require_relative 'game/author'
require_relative 'movie/movie'
require_relative 'movie/source'

class App
  # def initialize
  # @labels = load_data('./data/labels.json')
  # @books = load_data('./data/books.json')
  #   @music_albums = load_data('./data/music_albums.json')
  #   @genres = load_data('./data/genres.json')
  #   @games = load_data('./data/games.json')
  #   @authors = load_data('./data/authors.json')
  # end

  def get_user_input_int(message)
    puts message
    gets.chomp.to_i
  end

  def get_user_input_str(message)
    puts message
    gets.chomp.to_s
  end

  def list_all_books
    books = load_data('./data/books.json')
    if books.empty?
      puts 'There are no books in the catalogue'
    else
      books.each_with_index do |book, index|
        puts "#{index} Publisher: #{book['publisher']}, Publish Date: #{book['publish_date']}, Cover State: #{book['cover_state']}, Archived: #{book['archived']}"
      end
    end
  end

  def list_all_music_albums
    music_albums = load_data('./data/music_albums.json')
    if music_albums.empty?
      puts 'There are no music albums in the catalogue'
    else
      puts 'Music Albums 🎶'
      music_albums.each_with_index do |music_album, index|
        puts "#{index}. On spotify: #{music_album['on_spotify']}, Publish Date: #{music_album['publish_date']}, Archived: #{music_album['archived']}"
      end
    end
  end

  def list_all_movies
    movies = load_data('./data/movies.json')
    if movies.empty?
      puts 'There are no movies in the catalogue'
    else
      puts 'Movies 🎬'
      movies.each_with_index do |movie, index|
        puts "#{index}. Silet: #{movie['silet']}, Publish Date: #{movie['publish_date']}, Source: #{movie['source']}"
      end
    end
  end

  def list_all_games
    games = load_data('./data/games.json')
    if games.empty?
      puts 'There are no games in the catalogue'
    else
      puts 'Games 🎮'
      games.each_with_index do |game, index|
        puts "#{index}. Multiplayer: #{game['multiplayer']}, Publish Date: #{game['publish_date']}"
      end
    end
  end

  def list_all_genres
    genres = load_data('./data/genres.json')
    if genres.empty?
      puts 'There are no genres in the catalogue'
    else
      puts 'Genres 🎶'
      genres.each_with_index do |genre, index|
        puts "#{index}. Genre: #{genre['name']}"
      end
    end
  end

  def list_all_labels
    labels = load_data('./data/labels.json')
    labels.each_with_index do |label, index|
      puts "#{index}. #{label['title']} - #{label['color']}"
    end
  end

  def list_all_authors
    authors = load_data('./data/authors.json')
    if authors.empty?
      puts 'There are no authors in the catalogue'
    else
      puts 'Authors 📚'
      authors.each_with_index do |author, index|
        puts "#{index}. First name: #{author['first_name']}, Last name: #{author['last_name']}"
      end
    end
  end

  def list_all_sources
    sources = load_data('./data/sources.json')
    if sources.empty?
      puts 'There are no sources in the catalogue'
    else
      puts 'Sources 🎬'
      sources.each_with_index do |source, index|
        puts "#{index}. Name: #{source['name']}"
      end
    end
  end

  def add_book
    publisher = get_user_input_str('Enter the publisher')
    publish_date = get_user_input_str('Enter the publish date')
    puts 'Enter the cover state. Is it good or bad? [G/B]'
    cover_state = gets.chomp.upcase
    cover_state = cover_state == 'G' ? 'good' : 'bad'
    puts 'Choose a label for this book'
    title = get_user_input_str('Enter the label title')
    color = get_user_input_str('Enter the label color')
    book = Book.new(nil, publish_date, nil, publisher, cover_state)
    label = Label.new(title, color)
    book_item = book
    label.add_item(book_item)
    labels = load_data('./data/labels.json')
    labels << label
    save_data(labels, 'data/labels.json')
    puts 'Label added successfully'
    books = load_data('./data/books.json')
    books << book
    save_data(books, 'data/books.json')
    puts 'Book added successfully'
  end

  def add_music_album
    on_spotify = get_user_input_str('Is this music album on spotify? [Y/N]')
    on_spotify = on_spotify.upcase == 'Y'
    publish_date = get_user_input_str('Enter the publish date')
    genre = get_user_input_str('Enter the genre')
    music_album = MusicAlbum.new(nil, publish_date, nil, on_spotify, genre)
    genre = Genre.new(genre)
    music_album_item = music_album
    genre.add_item(music_album_item)
    genres = load_data('./data/genres.json')
    genres << genre
    save_data(genres, 'data/genres.json')
    puts 'Genre added successfully'
    music_albums = load_data('./data/music_albums.json')
    music_albums << music_album
    save_data(music_albums, 'data/music_albums.json')
    puts 'Music album added successfully'
  end

  def add_movie
    silet = get_user_input_str('Is this movie silet? [Y/N]')
    silet = silet.upcase == 'Y'
    publish_date = get_user_input_str('Enter the publish date')
    source = get_user_input_str('Enter the source')
    movie = Movie.new(nil, publish_date, nil, silet, source)
    source = Source.new(source)
    movie_item = movie
    source.add_item(movie_item)
    sources = load_data('./data/sources.json')
    sources << source
    save_data(sources, 'data/sources.json')
    puts 'Source added successfully'
    movies = load_data('./data/movies.json')
    movies << movie
    save_data(movies, 'data/movies.json')
    puts 'Movie added successfully'
  end

  def add_game
    first_name = get_user_input_str("Enter the author's first name")
    last_name = get_user_input_str("Enter the author's last name")
    author = Author.new(first_name, last_name)
    publish_date = get_user_input_str('Enter the publish date')
    multiplayer = get_user_input_str('Is this game multiplayer? [Y/N]')
    last_played_at = get_user_input_str('Enter the last time you played this game')
    game = Game.new(nil, publish_date, nil, multiplayer, last_played_at)
    game_item = game
    author.add_item(game_item)
    authors = load_data('./data/authors.json')
    authors << author
    save_data(authors, 'data/authors.json')
    puts 'Author added successfully'
    games = load_data('./data/games.json')
    games << game
    save_data(games, 'data/games.json')
    puts 'Game added successfully'
  end

  # def add_label
  #   title = get_user_input_str('Enter the label title')
  #   color = get_user_input_str('Enter the label color')
  #   label = Label.new(title, color)
  #   @labels << label
  #   save_data('labels.json', @labels)
  #   puts 'Label added successfully'
  # end
end
