require "pry"

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
    @songs << song
  end

  def self.find_or_create_by_name(name)
    @@all.detect do |art|
      if art.name == name
        return art
      end
    end
    artist = self.new(name)
    artist.name = name
    return artist
  end

  def print_songs
    @songs.each do |s|
      puts s.name
    end
  end

end
