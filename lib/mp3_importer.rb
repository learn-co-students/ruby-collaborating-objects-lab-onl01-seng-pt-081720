require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(filepath)
        @path = filepath
    end

    def files
        @files = Dir.children(@path) #.children gets filenames as an array except for "." and ".."
        #binding.pry
    end

    def import
        files.collect {|filename| Song.new_by_filename(filename)}
    end

end