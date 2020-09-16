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

    
    def self.new_by_filename(filename)
        split_name = filename.split(" - ")
        song = Song.new(split_name[1])
        song.artist_name = split_name[0]
        song
        #split filename into song and artist
        #create new Song with name equal to the string at index 1
        #set song artist to string at index 0
        #return the song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
        #set the artist of the Song instance to the Artist class via method
        #use the add_song instance method to add song to artist
    end
end