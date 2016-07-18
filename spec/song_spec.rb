describe 'Song' do 
  let(:song) {Song.new('Man in the Mirror')}
  let(:file_name) {'Michael Jackson - Black or White - pop.mp3'}

  before(:each) do 
    Song.class_variable_set(:@@all, [])
  end

  describe '#initialize with #name' do
    it 'accepts a name for the song' do
      expect(song.name).to eq('Man in the Mirror')
    end
    
    it 'does not add song to @@all class variable' do
      expect(Song.all).to_not include(song)
    end
  end

  describe '#name=' do
    it 'sets the song name' do
      song.name = 'Thriller'
      expect(song.name).to eq('Thriller')
    end
  end

  describe '#artist=' do
    it 'sets the artist object to belong to the song' do
      new_artist_object = Artist.new('King of Pop')
      song.artist = new_artist_object
      expect(song.artist).to eq(new_artist_object)
    end
  end
  
  describe '.all' do
    it 'does not return any songs if none are saved' do
      expect(Song.all).to eq([])
    end
    
    it 'returns @@all class variable' do
      Song.class_variable_set(:@@all, [song])
      
      expect(Song.all).to eq([song])
    end
  end
  
  describe '#save' do
    it 'adds song to @@all class variable' do
      song.save
      
      expect(Song.all).to eq([song])
    end
    
    it 'returns an instance of the artist class' do
      saved_song = song.save
      
      expect(saved_song).to eq(song)
    end
  end
  
  describe '#artist_name=' do
    it 'creates an artist object from a string' do
      
      song.artist_name=('Michael Jackson')
      
    end
    
    artist = Artist.new('Michael Jackson')
    
  end
  
  describe '.find_by_artist' do
    it 'finds all songs by a given artist object' do
      song.save
      artist_one = Artist.new("Michael Jackson")
      artist_two = Artist.new("Aesop Rock")
      song_two = Song.new("Rock With You").save
      song_three = Song.new("Lotta Years").save
      
      song.artist = artist_one
      song_two.artist = artist_one
      song_three.artist = artist_two
      
      expect(artist_one.songs).to include(song, song_two)
      expect(artist_one.songs).to_not include(song_three)
    end
  end

  describe '.new_by_filename' do 
    it 'creates a new instance of a song from the file that\'s passed in' do 
      new_instance = Song.new_by_filename(file_name)
      expect(new_instance.name).to eq('Black or White')
      expect(new_instance.artist.name).to eq('Michael Jackson')
    end
    
    it 'saves songs in the @@all array' do
      new_instance = Song.new_by_filename(file_name)
      
      expect(Song.all).to eq([new_instance])
    end
  end
end
