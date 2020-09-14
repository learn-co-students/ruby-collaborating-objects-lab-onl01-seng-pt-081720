require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []



  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(name)
    returned_artist = self.all.find{|x| x.name == name}

    if returned_artist
      returned_artist
    else
      new_artist = self.new(name)
      new_artist
    end
  end

  def print_songs
    self.songs.each{|x| puts x.name}
  end

  def self.all
    @@all
  end

end
