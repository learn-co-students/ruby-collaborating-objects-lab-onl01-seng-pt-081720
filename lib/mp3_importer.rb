require "pry"

class MP3Importer

  attr_accessor :path

  @mp3s = []
  def initialize(path)
    @path = path
  end

  def files
    @res = []
    files = Dir["#{@path}/*.mp3"]
    files.each do |f|
      @res << File.basename(f)
    end
    @res
  end

  def import
    self.files
    @res.each do |n|
      Song.new_by_filename(n)
    end
  end
end
