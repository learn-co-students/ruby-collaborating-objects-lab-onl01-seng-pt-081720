class Song
  attr_accessor :name, :artist, :artist_name
  @@all = []
  
  
  def initialize(name)
    @name=name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    split_filename = filename.split(" - ")
    song = self.new(split_filename[1])
    
    artist = Artist.find_or_create_by_name(split_filename[0])
    
    song.artist = artist
    
    artist.add_song(song)
    
     song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

    
  
  
end