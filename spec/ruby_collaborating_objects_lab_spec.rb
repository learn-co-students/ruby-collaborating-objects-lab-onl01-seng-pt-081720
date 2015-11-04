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

  describe '#artist=' do
    it 'sets the artist object to belong to the song' do
      new_artist_object = Artist.new('King of Pop')
      song.artist = new_artist_object
      expect(song.artist).to eq(new_artist_object)
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
    it 'accepts a name for the song' do
      expect(artist.name).to eq('Michael Jackson')
    end
  end

  describe '#name=' do
    it 'sets the song name' do
      artist.name = 'King of Pop'
      expect(artist.name).to eq('King of Pop')
    end
  end

  describe '#songs' do 
    it 'keeps track of an artist\'s songs' do 
      artist.add_song('Rock With You')
      artist.add_song('Smooth Criminal')
      expect(artist.songs).to eq(["Rock With You", "Smooth Criminal"])
    end
  end

  describe '#save' do
    it 'adds the artist instance to the @@all class variable' do
      artist.save
      expect(Artist.all).to include(artist)
    end
  end

  describe '.find_or_create_by_name' do
    it 'finds or creates an artist by name maintaining uniqueness of objects by name property' do
      artist_1 = Artist.find_or_create_by_name("Michael Jackson")
      artist_2 = Artist.find_or_create_by_name("Michael Jackson")
      expect(artist_1).to eq(artist_2)
    end
  end

  describe '#print_songs' do 
    it 'lists all of the artist\'s songs' do 
      artist.add_song('Dirty Diana')
      artist.add_song('Billie Jean')
      artist.add_song('Beat it')
      expect{artist.print_songs}.to output("Dirty Diana\nBillie Jean\nBeat it\n").to_stdout
    end
  end
end

