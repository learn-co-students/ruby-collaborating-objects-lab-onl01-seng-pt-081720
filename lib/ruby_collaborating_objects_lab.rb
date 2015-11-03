class Song
  attr_accessor :artist, :song

  def initialize(artist, song)
    @artist = artist
    @song = song
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    self.new(artist, song)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end


class Artist
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(name)
    self.find(name) ?  self.find(name) : self.create(name)
  end

  def self.find(name)
    @@all.find {|artist| artist.name == name }
  end


  def self.create(name)
    self.new(name).save
  end

  def save
    @@all << self
  end
end

Song.new_by_filename("Action Bronson - Some Song - rap.mp3")
Artist.create("Michael")
Artist.find_or_create_by_name("Mic")
