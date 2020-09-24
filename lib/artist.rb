class Artist
  attr_accessor :name
  attr_reader :songs
@@all=[]
  def initialize (name)
    @name = name
    @songs=[]
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  # def songs
  #   x= Song.artist == self
  #     puts x
  # end

  def self.find_or_create_by_name(name)
    self.all.detect{|artist|
      artist.name == name
      } || Artist.new(name)
  end

  def print_songs
    @songs.each {|song|
    puts song.name
  }
  end
end
