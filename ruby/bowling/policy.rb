class Game
  class Policy
    def valid_roll?(pins, frame)
      fail Game::BowlingError unless real_roll?(pins, frame)

      if last_frame_strike_bonus?(frame)
        fail Game::BowlingError unless possible_last_strike_score?(pins, frame)
      end
    end

    def show_score?(frame)
      last_frame_completed?(frame)
    end

    private

    def real_roll?(pins, frame)
      possible_roll?(pins) && frame_accepts_roll?(pins, frame)
    end

    def possible_roll?(pins)
      pins.between?(0, 10)
    end

    def frame_accepts_roll?(pins, frame)
      frame.possible_throw?(pins)
    end

    def last_frame_strike_bonus?(frame)
      frame.last? && frame.strike? && frame.last_bonus?
    end

    def possible_last_strike_score?(pins, frame)
      last_bonus = frame.bonus_throws.last
      return true if last_bonus == 10

      last_bonus + pins <= 10
    end

    def last_frame_completed?(frame)
      frame.last? && frame.completed?
    end
  end
end
