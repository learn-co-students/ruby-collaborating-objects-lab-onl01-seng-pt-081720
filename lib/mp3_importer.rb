class MP3Importer
    attr_accessor :path

    @@files = []

    def initialize(file_path)
        @path = file_path
    end

    def files
        Dir.entries(@path).each do |entry|
            if entry.include?(".mp3")
                @@files << entry
            end
        end
        import
        @@files
    end

    def import
        @@files.each do |item|
            Song.new_by_filename(item)
        end
    end
end