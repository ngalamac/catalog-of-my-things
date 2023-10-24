require_relative '../classes/author'

RSpec.describe Author do
  let(:author) { Author.new('Ian', 'Kiema') }
  describe '#initialize' do
    it 'creates a new author with a random id' do
      expect(author.id).to be_a(Integer)
    end
    it 'initializes items as an empty array' do
      expect(author.items).to eq([])
    end
  end
  describe '#add_item' do
    it 'adds an item to the author' do
      item = double('item')
      allow(item).to receive(:add_author)
      author.add_item(item)
      expect(author.items).to include(item)
    end
    it 'calls add_author on the added item' do
      item = double('item')
      expect(item).to receive(:add_author).with(author)
      author.add_item(item)
    end
  end
  describe 'accessors' do
    it 'allows reading and writing of first_name' do
      author.first_name = 'Ian'
      expect(author.first_name).to eq('Ian')
    end
    it 'allows reading and writing of last_name' do
      author.last_name = 'Kiema'
      expect(author.last_name).to eq('Kiema')
    end
  end
end
