# code should respond to MP3Importer.new, get a list of files in a directory
require 'pry'
class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  
  
  # file: load all mp3 files in the path directory
  # need 'size' method(split?)

  def files
    
    Dir[@path +"/*.mp3"].map {|file| file.split("/").last }
  end
  
  # import: send files into the library by creating songs from a filename.
  # :new_by_filename (iterate files)(from the Song class), Song.new_by_filename?

  def import
    files.each {|file| Song.new_by_filename(file)}
  end
 
    
    
  
  
  
  
end