require "pry"
class Song 
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize (name)
      @name = name 
      @@all << self
          
  end
  
  def self.all 
    @@all
  end 
  
  def self.new_by_filename(filename)
    split_name = filename.split(" - ")
    song = self.new(split_name[1])
    artist = Artist.find_or_create_by_name(split_name[0])
    song.artist = artist
    artist.add_song(song)
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
  
  
  
  
end