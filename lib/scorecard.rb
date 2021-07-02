class Scorecard

  def initialize
    @rolls = []
    @total = 0
  end

  def roll(pins)
    # checks no more than 10 pins per roll knocked down
    raise ('More than 10 pins detected, please check your roll') if pins > 10
    # check for strike in first 9 frames
    if pins == 10 && @rolls.length < 18
      @rolls << pins
      # complete the frame by adding 0 for roll 2 when there is a strike
      @rolls.push(0)
    else
      @rolls << pins
    end
  end

  def score
    # total score calculation broken down into two parts given complexity 
    calculate_first_nine_frames
    calculate_final_frame
    return @total
  end

  def calculate_first_nine_frames
    i = 0
    while i<18 do
      # checks for a strike using the iterator as index in @rolls array
      if strike?(i)
        @total += strike_bonus(i)
      elsif spare?(i)
        @total += spare_bonus(i)
      else
        @total += normal_score(i)
      end
      # advances iterator by 2 rolls to get the next frame
      i += 2
    end
  end

  def calculate_final_frame
    # checks if there is a spare or strike in roll 1 then adds the next 3 rolls
    if (@rolls[-2] + @rolls[-3]) == 10 || @rolls[-3] == 10
      @total += @rolls[-1] + @rolls[-2] + @rolls[-3] 
    else
      @total += @rolls[-1] + @rolls[-2]
    end
  end

  private

  def strike?(i)
    @rolls[i] == 10
  end

  def strike_bonus(i)
    # check if 3 strikes in a row and score 30 if so
    if @rolls[i] == 10 && @rolls[i + 2] == 10 && @rolls[i + 4] == 10
      return 30
    # check if 2 strikes in a row and add the right score (needs to skip a 0 for roll 2)
    elsif @rolls[i] == 10 && @rolls[i + 2] == 10
      return @rolls[i] + @rolls[i + 2] + @rolls[i + 4]
    else
      # if only 1 strike then add the next 2 rolls
      @rolls[i] + @rolls[i + 2] + @rolls[i + 3]
    end
  end

  def spare?(i)
    @rolls[i] + @rolls[i+1] == 10
  end

  def spare_bonus(i)
    # add the rolls for the frame + next roll bonus
    @rolls[i] + @rolls[i+1] + @rolls[i+2]
  end

  def normal_score(i)
    # add the rolls for the frame
    @rolls[i] + @rolls[i+1]
  end

end