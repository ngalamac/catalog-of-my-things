require './classes/book'
require 'rspec'

describe Book do
  before :all do
    @book = Book.new 'Publisher', 'good', '2022-12-12'
    @new_book_good = Book.new 'Publisher', 'good', '2022-12-12'
    @old_book_good = Book.new 'Publisher', 'good', '1990-12-12'
    @new_book_bad = Book.new 'Publisher', 'BaD', '2022-12-12'
    @old_book_bad = Book.new 'Publisher', 'BaD', '1990-12-12'
  end

  context '#new' do
    it 'should take three parameters and return a Book object' do
      expect(@book).to be_an_instance_of Book
    end

    it 'publish_date should be an istance of Date' do
      expect(@book.publish_date).to be_an_instance_of Date
    end
  end

  context 'should have correct attributes' do
    it 'should return the correct publisher' do
      expect(@book.publisher).to eq 'Publisher'
    end

    it 'should return the correct cover_state' do
      expect(@book.cover_state).to eq 'good'
    end

    it 'should return the correct publish_date' do
      expect(@book.publish_date.year).to eq 2022
    end

    it 'should return the correct archived' do
      expect(@book.archived).to eq false
    end
  end

  context '#can_be_archived?' do
    it 'should return false for @new_book_good' do
      expect(@new_book_good.instance_eval('can_be_archived?', __FILE__, __LINE__)).to eq false
    end

    it 'should return true for @old_book_good' do
      expect(@old_book_good.instance_eval('can_be_archived?', __FILE__, __LINE__)).to eq true
    end

    it 'should return true for @new_book_bad' do
      expect(@new_book_bad.instance_eval('can_be_archived?', __FILE__, __LINE__)).to eq true
    end

    it 'should return true for @old_book_bad' do
      expect(@old_book_bad.instance_eval('can_be_archived?', __FILE__, __LINE__)).to eq true
    end
  end
end
