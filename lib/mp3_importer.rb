class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |file_name| file_name.gsub("#{path}/", "") }
  end

  def import
    files.each{|some_filename| Song.new_by_filename(some_filename)}
  end
end
