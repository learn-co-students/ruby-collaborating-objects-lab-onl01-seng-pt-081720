class Song 
  
   attr_accessor :name , :artist 

 
 def initialize(name)
   @name = name 
 end 
 
 def self.new_by_filename(filename)
  split_name = filename.split(" - ")
  song = self.new(split_name[1])
  artist = Artist.find_or_create_by_name(split_name[0])
  song.artist = artist 
  artist.add_song(song)
end 

 def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end
  
  def import 
    self.files each do |file|
     song = Song.new_by_filename(file)
     Artist.all << song.artist unless Artist.all.include?(song.artist)
    end 

end