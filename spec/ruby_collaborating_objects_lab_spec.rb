describe 'Song' do 
  let(:song) {Song.new('Man in the Mirror')}
  let(:file) {'Michael Jackson - Black or White - pop.mp3'}

  describe '#initialize with #name' do
    it 'accepts a name for the song' do
      expect(song.name).to eq('Man in the Mirror')
    end
  end

  describe '#name=' do
    it 'sets the song name' do
      song.name = 'Thriller'
      expect(song.name).to eq('Thriller')
    end
  end

  describe '.new_by_filename' do 
    it 'creates a new instance of a song from the file that\'s passed in' do 
      new_instance = Song.new_by_filename(file)
      expect(new_instance.name).to eq('Black or White')
      expect(new_instance.artist.name).to eq('Michael Jackson')
    end
  end
end


describe 'Artist' do 
  let(:artist) {Artist.new('Michael Jackson')}
  
  describe '#initialize with #name' do
    it 'accepts a name for the artist' do
      expect(artist.name).to eq('Michael Jackson')
    end
  end

  describe '#save' do
    it 'adds the song instance to the @@all class variable' do
      artist.save
      expect(Artist.all).to include(artist)
    end
  end
end

