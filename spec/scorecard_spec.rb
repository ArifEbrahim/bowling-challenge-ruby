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

    context 'in a gutter game' do
      it 'returns 0 ' do
        10.times{ scorecard.roll(0) }
        expect(scorecard.score).to eq(0)
      end
    end

    context 'in a normal game' do
      it 'returns the score' do
        10.times{ scorecard.roll(2) }
        expect(scorecard.score).to eq(20)
      end
    end



  end



end