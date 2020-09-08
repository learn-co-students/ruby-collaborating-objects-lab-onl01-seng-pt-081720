require "pry"

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
    data = file.split(" - ")
    cancion = data[1]
    art = data [0]
    nueva = Song.new(cancion)
    nueva.artist_name = art
    nueva
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end
end
