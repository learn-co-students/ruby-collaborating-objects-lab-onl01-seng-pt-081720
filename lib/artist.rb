require 'pry'

class Artist 
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def songs 
    Song.all.select { |s| s.artist == self }
  end

  
  def add_song(song)
    song.artist = self
    @songs << song
  end
  
  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.new(name)
  end
  
  def self.find(name)
    self.all.find { |a| a.name == name }
  end
  
  def print_songs
    songs.each { |song| puts song.name }
  end
end