require 'pry'

class Artist 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
  end
  
  def self.all
    @@all 
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song) 
    song.artist = self
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name 
    song
  end 

  def self.find_by_name(name)
    binding.pry
    @@all.each do |song|
      if song.name == name
        return song
      end 
    end
  end 

  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end
  
   def self.find(name)    
    self.all.detect { |artist| artist.name == name }
  end

  def self.create(name)   
    artist = self.new(name)
    artist
  end
 
   def print_songs 
    Song.all.each do |song| 
      puts song.name if song.artist == self
    end
  end

  
end