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
  

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(name)
  end
  
  def self.new_by_filename(file)
    # split song name from artist name, save them on different variables
    # chomp off -.mp3?
    # artist_name[0]
    # song_name[1]
    edited_file = file.chomp(".mp3").split(" - ")
    song = self.new(edited_file[1])
    song.artist_name = edited_file[0]
    song
  end
end