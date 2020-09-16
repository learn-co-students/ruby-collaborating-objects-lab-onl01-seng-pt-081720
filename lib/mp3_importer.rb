require 'pry'

class MP3Importer

    attr_accessor :path

    def initialize(filename)
        @path = filename
    end

    def files
        @files = Dir.entries(@path)
        @files.delete_if {|file| file == "." || file == ".." }
    end

    def import 
        self.files.each do |file|
        Song.new_by_filename(file)
        end
        #for each filename that is imported
        #create a new Song using the new_by_filename method
    end

end