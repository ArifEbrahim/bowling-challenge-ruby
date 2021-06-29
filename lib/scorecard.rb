class Scorecard

  def initialize
    @rolls = []
  end

  def roll(pins)
    if pins == 10
      @rolls << pins
      @rolls.push(0)
    else
      @rolls << pins
    end
  end

  def score
    total = 0
    i = 0
    while i<10 do
      if strike?(@rolls[i])
        total += bonus(@rolls[i], @rolls[i+2], @rolls[i+3])
      elsif spare?(@rolls[i], @rolls[i+1])
        total += bonus(@rolls[i],@rolls[i+1], @rolls[i+2])
      else
        total += normal_score(@rolls[i], @rolls[i+1])
      end
      i += 2
    end
    return total
  end

  private

  def strike?(roll)
    roll == 10
  end

  def spare?(roll_1, roll_2)
    roll_1 + roll_2 == 10
  end

  def bonus(roll_1, roll_2, roll_3)
    roll_1 + roll_2 + roll_3
  end

  def normal_score(roll_1, roll_2)
    roll_1 + roll_2
  end

end