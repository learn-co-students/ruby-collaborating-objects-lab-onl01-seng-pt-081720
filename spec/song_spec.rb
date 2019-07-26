describe 'Song' do
  
  before(:example) {
    Song.class_variable_set(:@@all, [])
  }

  describe '#initialize with a name' do
    it 'accepts a name for the song and makes it accessible through an attribute accessor' do
      song = Song.new('Man in the Mirror')
      expect(song.name).to eq('Man in the Mirror')
    end
  end

  describe '#name=' do
    it 'sets the song name' do
      song = Song.new('Man in the Mirror')
      song.name = 'Thriller'
      expect(song.name).to eq('Thriller')
    end
  end

  describe '#artist=' do
    it 'sets the artist object to belong to the song' do
      song = Song.new('Man in the Mirror')
      new_artist_object = Artist.new('King of Pop')
      song.artist = new_artist_object
      expect(song.artist).to eq(new_artist_object)
    end
  end

  describe '.all' do
    it 'returns all existing Song instances' do
      song = Song.new('Man in the Mirror')
      expect(Song.all).to eq([song])
      purple_rain = Song.new('Purple Rain')
      expect(Song.all).to eq([song, purple_rain])
    end
  end

  describe '.new_by_filename' do
    it 'creates a new instance of a song from the file that\'s passed' do
      file_name = 'Michael Jackson - Black or White - pop.mp3'
      new_instance = Song.new_by_filename(file_name)
      expect(new_instance.name).to eq('Black or White')
    end

    it 'associates new song instance with the artist from the filename' do
      Artist.class_variable_set("@@all",[])
      file_name = 'Michael Jackson - Black or White - pop.mp3'

      new_instance = Song.new_by_filename(file_name)
      expect(new_instance.artist.name).to eq('Michael Jackson')
      expect(Artist.all.size).to eq(1)
      expect(Artist.all.first.songs.empty?).to eq(false)
    end
  end

  describe '#artist_name=' do
    it "accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute" do
      Artist.class_variable_set("@@all",[])

      song = Song.new('Man in the Mirror')
      song.artist_name = "Michael Jackson"
      expect(song.artist).to be_an(Artist)
      expect(song.artist.name).to eq("Michael Jackson")

      song_2 = Song.new('Thriller')
      song_2.artist_name = "Michael Jackson"
      expect(song_2.artist).to be_an(Artist)
      expect(song_2.artist.name).to eq("Michael Jackson")

      expect(Artist.all.length).to eq(1)
    end
  end
end


