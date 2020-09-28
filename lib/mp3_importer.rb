class MP3Importer
  attr_accessor :path 

  def initialize(path)
    @path = path 
  end
  
  def files
    Dir.children(@path)
  end
  
  def import 
    files.each do |files_name|
    Song.new_by_filename(files_name)
    end
  end
end