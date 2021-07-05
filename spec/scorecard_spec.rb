require 'scorecard'

RSpec.describe Scorecard do
  let(:scorecard) {described_class.new}

  describe '#roll' do
    it 'allows players to make rolls' do
      expect(scorecard).to respond_to(:roll).with(1).argument 
    end

    it 'displays an error if more than 10 pins knocked down' do
      expect{ scorecard.roll(12) }.to raise_error('More than 10 pins detected, please check your roll')
    end
  end

  describe '#score' do

  it 'has a score method' do
    expect(scorecard).to respond_to(:score)
  end

  it 'raises an error if score calculated before end of game' do
    expect{ scorecard.score }.to raise_error('The game has not ended yet, please enter more rolls')
  end

  context 'when there is no special scoring' do
    it 'returns 0 when its a gutter game' do
      20.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(0)
    end


    it 'returns the score for a normal game' do
      20.times{ scorecard.roll(2) }
      expect(scorecard.score).to eq(40)
    end
  end

  context 'returns the correct score' do
    it 'when there is a spare' do
      scorecard.roll(5)
      scorecard.roll(5)
      scorecard.roll(2)
      17.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(14)
    end
  end

  context 'returns the correct score when' do
    it 'there is 1 strike' do
      scorecard.roll(10)
      scorecard.roll(2)
      scorecard.roll(2)
      16.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(18)
    end

    it 'there are 2 strikes' do
      scorecard.roll(10)
      scorecard.roll(10)
      scorecard.roll(2)
      scorecard.roll(2)
      15.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(40)
    end

    it 'there are 3 strikes' do
      scorecard.roll(10)
      scorecard.roll(10)
      scorecard.roll(10)
      14.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(60)
    end
  end

  context 'returns the correct score for frame 10' do
    it 'with no special scoring' do
      18.times{ scorecard.roll(0) }
      scorecard.roll(2)
      scorecard.roll(2)
      expect(scorecard.score).to eq(4)
    end

    it 'with a spare' do
      18.times{ scorecard.roll(0) }
      scorecard.roll(5)
      scorecard.roll(5)
      scorecard.roll(2)
      expect(scorecard.score).to eq(12)
    end

    it 'with 1 strike' do
      18.times{ scorecard.roll(0) }
      scorecard.roll(10)
      scorecard.roll(5)
      scorecard.roll(2)
      expect(scorecard.score).to eq(17)
    end

    it 'with 2 strikes' do
      18.times{ scorecard.roll(0) }
      scorecard.roll(10)
      scorecard.roll(10)
      scorecard.roll(2)
      expect(scorecard.score).to eq(22)
    end

    it 'with 3 strikes' do
      18.times{ scorecard.roll(0) }
      scorecard.roll(10)
      scorecard.roll(10)
      scorecard.roll(10)
      expect(scorecard.score).to eq(30)
    end
  end

  it 'passes the Makers stress test' do
    scorecard.roll(1)
    scorecard.roll(4)
    scorecard.roll(4)
    scorecard.roll(5)
    scorecard.roll(6)
    scorecard.roll(4)
    scorecard.roll(5)
    scorecard.roll(5)
    scorecard.roll(10)
    scorecard.roll(0)
    scorecard.roll(1)
    scorecard.roll(7)
    scorecard.roll(3)
    scorecard.roll(6)
    scorecard.roll(4)
    scorecard.roll(10)
    scorecard.roll(2)
    scorecard.roll(8)
    scorecard.roll(6)
    expect(scorecard.score).to eq(133)
  end
end
end