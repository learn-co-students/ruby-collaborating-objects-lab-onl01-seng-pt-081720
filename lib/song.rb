require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist=(artist)
        @artist = artist
        @artist.songs << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        song_temp = file.chomp(".mp3").split(" - ")
        song = Song.new(song_temp[1])
        song.artist_name = song_temp[0]
        song
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
        

end