require 'pry'
class MP3Importer

  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    @files = Dir.children(@path)
    # loads all files in path dir just the mp3 filename w/no path
  end

  def import
    # imports the files into the lib by creating songs from a filename
    # binding.pry
    files.map{ |filename| Song.new_by_filename(filename)}
  end

end