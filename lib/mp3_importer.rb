class MP3Importer
   attr_accessor :path

    def initialize(filepath)
     @path = filepath
   end

    def files
     Dir[@path+"/*.mp3"].collect { |file| file.split("/").last }
   end

    def import
     files.each { |file| Song.new_by_filename(file) }
   end
 end