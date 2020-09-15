class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self

  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def print_songs
    puts @songs.collect {|x| x.name}
  end

  def self.find_or_create_by_name(name)
    self.all.detect{|artist| artist.name == name} || Artist.new(name)
  end

end
