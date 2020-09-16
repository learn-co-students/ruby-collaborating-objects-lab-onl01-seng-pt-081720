require 'pry'

class Artist

    attr_accessor :name

    @@all = [] #class variable for all Artist instances

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all #class method
        @@all #returns all Artist instances
    end

    def add_song(song)
       song.artist = self
       @songs << song
        #song class is responsible for artist relationship
        #call on song class and artist variable within song class
        #and set it equal to self
        #in this case, self is the artist instance
        #push songs into @songs array
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name) #class method
        self.all.detect {|artist| artist.name == name} || self.new(name)
        #detect artists within class
        #if artist exists with varible name do nothing
        #if artist doesn't exist, create one
    end

    def print_songs
        @songs.each { |song| puts song.name}
        #for each song in @songs, puts the song name
    end

end