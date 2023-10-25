require './classes/genre'
require './classes/item'

describe Genre do
  before :all do
    @genre_name = 'Rock'
    @genre = Genre.new(@genre_name)
    @item = Item.new '2022-12-12'
  end

  context '#initialize' do
    it 'sets the name correctly' do
      expect(@genre.name).to eq(@genre_name)
    end

    it 'initializes the items array' do
      expect(@genre.items).to be_an(Array)
      expect(@genre.items).to be_empty
    end

    it 'generates a random id' do
      expect(@genre.instance_variable_get(:@id)).to be_an(Integer)
    end
  end

  context '#add_item' do
    before :all do
      @genre.add_item(@item)
    end

    it 'should have one item in @items array' do
      expect(@genre.items.length).to eq 1
    end

    it 'added item should be an instance of Item' do
      expect(@genre.items[0]).to be_an_instance_of Item
    end

    it 'added item should be equal to @item' do
      expect(@genre.items[0]).to eq @item
    end

    it "item's genre should be equal to @genre" do
      expect(@item.genre).to eq @genre
    end
  end
end
