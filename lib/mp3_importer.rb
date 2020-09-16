class MP3Importer
    attr_accessor :path

    def initialize(file)
        @path = file

    end

    def files
        @files = Dir.entries(@path)
        @files.delete_if {|file| file == "." || file == ".."}
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end