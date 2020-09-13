require "pry"
class MP3Importer 
  
  attr_accessor :path
  
  def initialize(filepath)
    @path = filepath
  end
  
  def files
    new_array = []
    Dir.foreach(@path) do |file|
      if file != ".." && file != "."
         new_array << file
      end
    
    
       
     end
     new_array
  
  end
  
  def import 
    self.files.each do |filename|
      Song.new_by_filename(filename)
      
    end
  end
  
  
end