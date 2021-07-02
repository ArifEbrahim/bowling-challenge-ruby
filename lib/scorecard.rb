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
    while i<18 do
      if strike?(i)
        total += strike_bonus(i)
      elsif spare?(@rolls[i], @rolls[i+1])
        total += spare_bonus(@rolls[i],@rolls[i+1], @rolls[i+2])
      else
        total += normal_score(@rolls[i], @rolls[i+1])
      end
      i += 2
    end

    if (@rolls[-2] + @rolls[-3]) == 10
      total += @rolls[-1] + @rolls[-2] + @rolls[-3] 
    else
      total += @rolls[-1] + @rolls[-2]
    end

    return total
  end

  private

  def strike?(i)
    @rolls[i] == 10
  end

  def strike_bonus(i)
    if @rolls[i] == 10 && @rolls[i + 2] == 10 && @rolls[i + 4] == 10
      return 30
    elsif @rolls[i] == 10 && @rolls[i + 2] == 10
      return @rolls[i] + @rolls[i + 2] + @rolls[i + 4]
    else
      @rolls[i] + @rolls[i + 2] + @rolls[i + 3]
    end
  end

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