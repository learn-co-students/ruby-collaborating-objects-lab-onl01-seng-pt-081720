require "pry"
class Artist 
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs 
    Song.all.select {|the_song| the_song.artist == self}
  end
  
  def self.find_or_create_by_name(name)
   self.all.detect {|artist| artist.name == name} || Artist.new(name)
  end
  
  def print_songs
    puts self.songs.collect {|x| x.name}
  end
  

  
end