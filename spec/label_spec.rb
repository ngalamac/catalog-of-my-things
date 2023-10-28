require './classes/label'
require './classes/item'

describe Label do
  before :all do
    @label = Label.new 'Title', 'Color'
    @item = Item.new '2022-12-12'
  end

  context '#new' do
    it 'should take two parameters and return a Label object' do
      expect(@label).to be_an_instance_of Label
    end

    it 'item should have no label' do
      expect(@item.label).to be nil
    end
  end

  context 'should have correct attributes (title, color, items)' do
    it 'should return the correct title' do
      expect(@label.title).to eq 'Title'
    end

    it 'should return the correct color' do
      expect(@label.color).to eq 'Color'
    end

    it 'should have 0 items in @items array' do
      expect(@label.items.length).to eq 0
    end
  end

  context '#add_item' do
    before :all do
      @label.add_item(@item)
    end

    it 'should have one item in @items array' do
      expect(@label.items.length).to eq 1
    end

    it 'added item should be an instance of Item' do
      expect(@label.items[0]).to be_an_instance_of Item
    end

    it 'added item should be equal to @item' do
      expect(@label.items[0]).to eq @item
    end

    it "item's label should be equal to @label" do
      expect(@item.label).to eq @label
    end
  end
end
