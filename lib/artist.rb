require 'pry'

class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
        @songs << song
    end

    def songs
        Song.all.select {|song| song.artist == self} #outputs complete song instances
    end

    def self.find_or_create_by_name(name) #name of artist = string in this case
        self.all.detect{|artist| artist.name == name} || artist = self.new(name)
    end

    def print_songs #should only output names of songs
        @songs.each {|song| puts song.name}
    end
end