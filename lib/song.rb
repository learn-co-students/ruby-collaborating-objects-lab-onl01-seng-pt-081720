class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(name)
    file = name.split(" - ")
    song_name = file[1]
    song_artist = file[0]

    song = self.new(song_name)
    song.artist_name = song_artist
    @@all << song
    song
  end

  def artist_name=(name)
      self.artist = Artist.find_or_create_by_name(name)
      artist.add_song(self)
    end

  def self.all
    @@all
  end

end
