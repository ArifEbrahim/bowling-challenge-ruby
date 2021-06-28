class Scorecard

  def initialize
    @total_score = []
  end

  def roll(pins)
    @total_score << pins
  end

  def score
    @total_score.sum
  end


end