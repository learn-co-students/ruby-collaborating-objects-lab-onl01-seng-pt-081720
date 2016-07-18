describe 'Artist' do
  let(:artist) {Artist.new('Michael Jackson')}

  describe '#initialize with #name' do
    it 'accepts a name for the artist' do
      expect(artist.name).to eq('Michael Jackson')
    end
  end

  describe '#name=' do
    it 'sets the artis name' do
      artist.name = 'King of Pop'
      expect(artist.name).to eq('King of Pop')
    end
  end

  describe '#songs' do
    it 'keeps track of an artist\'s songs' do
      song_one = Song.new("Rock With You").save
      song_two = Song.new("Smooth Criminal").save
      song_one.artist = artist
      song_two.artist = artist
      expect(artist)
      expect(artist.songs).to eq([song_one, song_two])
    end
    
    it 'does not store songs as an instance variable' do
      song_one = Song.new("Rock With You").save
      song_two = Song.new("Smooth Criminal").save
      song_one.artist = artist
      song_two.artist = artist
      expect(artist.instance_variable_get(:@songs)).to eq(nil)
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

    it 'Creates new instance of Artist if none exist' do
      artist_1 = Artist.find_or_create_by_name("Drake")
      expect(artist_1.class).to eq(Artist)
    end
  end

  describe '#print_songs' do
    it 'lists all of the artist\'s songs' do
      dirty_diana = Song.new("Dirty Diana").save
      billie_jean = Song.new("Billie Jean").save
      dirty_diana.artist = artist
      billie_jean.artist = artist
      expect{artist.print_songs}.to output("Dirty Diana\nBillie Jean\n").to_stdout
    end
  end
end
