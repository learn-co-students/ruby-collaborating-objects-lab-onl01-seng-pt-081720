require 'pry'
class Artist 
  attr_accessor :name, :songs 
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
  def add_song(song)
    @songs << song
  end
  
  def self.find_or_create_by_name(artist)
    self.all.detect{|a| a.name == artist} || self.new(artist) #a counts for all instances of artists' names in array. 
  end
  
  def print_songs
    @songs.each { |song| puts song.name}
  end
end