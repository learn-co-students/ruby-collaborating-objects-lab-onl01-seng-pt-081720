require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist=(new_artist)
        @artist = new_artist
    end

    def self.all
        @@all
    end

    def self.new_by_filename(name)
        song_parts = name.split(" - ");
        new_song = Song.new(song_parts[1])
        artist = Artist.find_or_create_by_name(song_parts[0])
        new_song.artist = artist
        new_song
    end

    def artist_name=(name)
        if Artist.all.length > 0
            Artist.all.each do |artist|
                if artist.name == name
                    self.artist = artist
                end
            end
        else
            self.artist = Artist.new(name)
        end
    end
end