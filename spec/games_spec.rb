require_relative '../classes/game'

RSpec.describe Game do
  let(:publish_date) { '2022-01-01' }
  let(:last_played_at) { '2023-01-01' }
  let(:game) { Game.new(true, last_played_at, publish_date) }

  describe '#initialize' do
    it 'creates a new game with specified attributes' do
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at.to_s).to eq(last_played_at)
      expect(game.publish_date.to_s).to eq(publish_date)
      expect(game.archived).to eq(false)
    end
  end

  describe '#can_be_archived?' do
    context 'when last_played_at is more than 2 years ago and super is true' do
      let(:last_played_at) { '2020-01-01' }
      let(:publish_date) { '1994-01-01' }

      it 'returns true' do
        expect(game.can_be_archived?).to eq(true)
      end
    end

    context 'when last_played_at is more than 2 years ago and super is false' do
      let(:last_played_at) { '2020-01-01' }
      let(:publish_date) { '2022-01-01' }

      it 'returns true' do
        expect(game.can_be_archived?).to eq(false)
      end
    end

    context 'when last_played_at is within the last 2 years' do
      let(:last_played_at) { '2020-01-01' }

      it 'returns false' do
        expect(game.can_be_archived?).to eq(false)
      end
    end

    context 'when the game is already archived' do
      let(:game) { Game.new(true, last_played_at, publish_date, archived: true) }

      it 'returns true' do
        expect(game.can_be_archived?).to eq(false)
      end
    end
  end
end
