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
    self.songs << song
    # song.artist = self
    
  end
  
  # need to create individual .find and .create methods to compare
  
  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end
  
  def self.find(name)
    self.all.find {|x| x.name}
    
  end
  
  def self.create(name)
    artist = self.new(name)
    # artist.name = name
    artist
  end
  
  def print_songs
    # print every song: will need to iterate
    self.songs.each {|s| puts s.name}
  end
  
  
end