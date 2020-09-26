class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(new_song)
        new_song.artist = self
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_find_create)
        artist_to_return = Artist.new(artist_find_create)
        @@all.each do |artist|
            if artist.name == artist_find_create
                return artist
            end
        end
        artist_to_return
    end

    def print_songs
        array_songs = Song.all.select{|song| song.artist == self}
        array_songs.each do |song|
            puts song.name
        end
    end
end