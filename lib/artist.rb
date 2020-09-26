class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def print_songs
    songs.each { |song| puts song.name}
  end

  def self.find_or_create_by_name(name)
    self.all.detect { |artist| artist.name == name} || Artist.new(name)
  end
end