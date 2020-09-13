require 'pry'

class MP3Importer
    attr_accessor :music_importer

    def initialize(music_importer)
        @music_importer = music_importer
    end

    def path
        @music_importer
    end

    def files
        @music_importer
        binding.pry
    end


end