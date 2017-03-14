class Frame
  attr_accessor :throws, :bonus_throws
  attr_reader :position

  def initialize(position)
    @position = position
    @throws = []
    @bonus_throws = []
  end

  def add_throw(pins)
    @throws << pins
  end

  def possible_throw?(pins)
    return true if spare? || strike? || throws.empty?
    return false if open?
    throws.first + pins <= 10
  end

  def knocked_down_pins
    throws.sum
  end

  def update(pins)
    @bonus_throws << pins if can_update?
  end

  def finished?
    return true if strike?
    throws.count == 2
  end

  def completed?
    return true if open?
    !can_update?
  end

  def strike?
    throws.first == 10
  end

  def spare?
    throws.count == 2 && knocked_down_pins == 10
  end

  def open?
    throws.count == 2 && knocked_down_pins < 10
  end

  def score
    if strike? || spare?
      10 + bonus_throws.sum
    else
      knocked_down_pins
    end
  end

  def first?
    position == 0
  end

  def last?
    position == 9
  end

  def last_bonus?
    (spare? && bonus_throws.empty?) || (strike? && bonus_throws.count == 1)
  end

  def accepts_bonus?
    can_update?
  end

  private

  def can_update?
    spare_and_not_complete? || strike_and_not_complete?
  end

  def spare_and_not_complete?
    spare? && bonus_throws.count < 1
  end

  def strike_and_not_complete?
    strike? && bonus_throws.count < 2
  end
end
