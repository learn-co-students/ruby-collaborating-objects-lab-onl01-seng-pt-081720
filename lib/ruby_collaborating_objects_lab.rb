class Song
  attr_accessor :artist, :song

  def initialize(artist, song)
    @artist = artist
    @song = song
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    Song.new(artist, song)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end


class Artist
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(name)
    Artist.new()
  end
end

Song.new_by_filename("Action Bronson - Some Song - rap.mp3")