class MP3Importer 
  attr_accessor :path 
  
  def initialize (filepath)
    @path = filepath  
  end 
  
  def files 
    @files = Dir.entries(@path)
    @files.delete_if {|file| file == "." || file ==".."}
    end 
    
     def import
      self.files.each{|file| Song.new_by_filename(file)}
    end
    end 
  