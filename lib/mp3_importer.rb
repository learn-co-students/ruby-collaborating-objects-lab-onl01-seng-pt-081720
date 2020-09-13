require 'pry'

class MP3Importer
    attr_accessor :music_importer

    def initialize(music_importer)
        @music_importer = music_importer
    end

    def path
        @music_importer
    end

    def import
        files.each do |x|
            Song.new_by_filename(x)
        end
        
    end

    def files
        file = []
        (Dir.glob("#{path}/*.mp3")).each {|x| file << (x.split("/")[-1])}
        file
    end


end