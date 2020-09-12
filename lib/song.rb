require 'pry'

class Song 
  attr_accessor :name, :artist 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
   def artist_name 
    if self.artist
      self.artist.name 
    else 
      nil
    end
  end
  
   def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
   def self.new_by_filename(file)
    song_inf = file.chomp(".mp3").split(" - ")
    song = Song.new(song_inf[1])
    song.artist_name = song_inf[0]
    song
   end



end