require 'scorecard'

RSpec.describe Scorecard do
  let(:scorecard) {described_class.new}

  describe '#roll' do
    it 'allows players to make rolls' do
      expect(scorecard).to respond_to(:roll).with(1).argument 
    end
  end

  describe '#score' do

  it 'can calculate the score for a finished game' do
    expect(scorecard).to respond_to(:score)
  end

  context 'when there is no special scoring' do
    it 'returns 0 when its a gutter game' do
      20.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(0)
    end
  end

    it 'returns the score for a normal game' do
      20.times{ scorecard.roll(2) }
      expect(scorecard.score).to eq(40)
    end
  end

  context 'when there is a spare' do
    it 'returns the correct score' do
      scorecard.roll(5)
      scorecard.roll(5)
      scorecard.roll(2)
      17.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(14)
    end
  end

  context 'when there is a strike' do
    it 'when there is 1 strike' do
      scorecard.roll(10)
      scorecard.roll(2)
      scorecard.roll(2)
      16.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(18)
    end

    it 'when there are 2 strikes' do
      scorecard.roll(10)
      scorecard.roll(10)
      scorecard.roll(2)
      scorecard.roll(2)
      15.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(40)
    end

    it 'when there are 3 strikes' do
      scorecard.roll(10)
      scorecard.roll(10)
      scorecard.roll(10)
      14.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(60)
    end
  end
end