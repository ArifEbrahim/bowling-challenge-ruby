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

    it 'returns 0 when its a gutter game' do
      10.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(0)
    end

    it 'when its a normal game' do
      10.times{ scorecard.roll(2) }
      expect(scorecard.score).to eq(20)
    end

    it 'when there is a spare' do
      scorecard.roll(5)
      scorecard.roll(5)
      scorecard.roll(2)
      7.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(14)
    end





  end



end