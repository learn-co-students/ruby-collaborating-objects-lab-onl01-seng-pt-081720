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

  def self.new_by_filename(file)
    file_split = file.chomp(".mp3").split(" - ") # remove .mp3 & (" - ")
    song = self.new(file_split[1]) # creates a new instance from the filename that's passed
    song.artist = Artist.find_or_create_by_name(file_split[0])
    song
  end

  def artist_name=(artist_name)
    # send an artist_name to Artist.find_or_create_by_name
    self.artist = Artist.find_or_create_by_name(artist_name)
  end
end