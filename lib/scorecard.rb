class Scorecard

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total = 0
    i = 0
    while i<10 do
      if spare?(@rolls[i], @rolls[i+1])
        total += spare_bonus(@rolls[i],@rolls[i+1], @rolls[i+2])
      else
        total += normal_score(@rolls[i], @rolls[i+1])
      end
      i += 2
    end
    return total
  end

  private

  def spare?(roll_1, roll_2)
    roll_1 + roll_2 == 10
  end

  def spare_bonus(roll_1, roll_2, roll_3)
    roll_1 + roll_2 + roll_3
  end

  def normal_score(roll_1, roll_2)
    roll_1 + roll_2
  end

end