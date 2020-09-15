require 'pry'
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
    song.artist = self 
    @songs << song  
  end

  def songs
    # gets all song instances from Song.select the ones associated w Artist
    Song.all.select{|song| song.artist == self}
  end

  def self.find_or_create_by_name(name)
    self.all.find{|artist| artist.name == name} || artist = self.new(name)
    # find |artist|  by name OR creates new Artist if none
  end

  def print_songs
    # lists all of the artist's songs
    @songs.each{|song| puts song.name}
  end
end