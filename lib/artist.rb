require 'pry'
class Artist
  attr_accessor :name, :songs 
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def add_song(song)
    @songs << song
 end
 
 def save
   @@all << self
 end
 
  def self.all
    @@all
  end
  
  def self.find_or_create_by_name(name)
    art = self.all.detect do |artist| 
        artist.name == name
      end
      if art
        art
    else
      Artist.new(name)
    end
    
    end
  
  def print_songs 
    @songs.each do |song| 
    puts song.name
  end
end
end
