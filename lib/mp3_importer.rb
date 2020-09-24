class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path  
  end

  def files
    Dir.entries(path).keep_if {|file| file.match(/(mp3$)/)}
  end

  def import
    files.each {|file_name| Song.new_by_filename(file_name)}
  end

end