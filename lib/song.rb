require 'pry'
class Song 
  attr_accessor :name, :artist
  @@all= []
  
  def initialize(name)
    @name = name 
    @@all << self 
  end
  
  def self.all 
    @@all 
  end
  
  def self.new_by_filename(filename)
    filename_array = filename.split (" - ")
     song = Song.new(filename_array[1]) 
     artist = filename_array[0]
     song.artist_name = artist
     song
  end
  
  def artist_name=(name)
   self.artist = Artist.find_or_create_by_name(name)
   self.artist.add_song(self)
  end
end 