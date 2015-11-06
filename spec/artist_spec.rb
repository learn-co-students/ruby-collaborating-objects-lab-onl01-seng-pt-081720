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
      expect(artist_1).to equal(artist_2)
    end

    it 'Creates new instance of Artist if none exist' do
      artist_1 = Artist.find_or_create_by_name("Drake")
      expect(artist_1.class).to eq(Artist)
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

