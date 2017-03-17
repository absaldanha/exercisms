class Clock
  attr_reader :hours, :minutes

  def self.at(hours, minutes)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    @hours = calculate_hours(hours, minutes)
    @minutes = calculate_minutes(minutes)
  end

  def to_s
    sprintf("%02d:%02d", hours, minutes)
  end

  def +(minutes)
    added_minutes = @minutes + minutes

    @hours = calculate_hours(hours, added_minutes)
    @minutes = calculate_minutes(added_minutes)

    self
  end

  def ==(clock)
    [hours, minutes] == [clock.hours, clock.minutes]
  end

  private

  def calculate_hours(hours, minutes)
    (hours + minutes.div(60)) % 24
  end

  def calculate_minutes(minutes)
    minutes % 60
  end
end

module BookKeeping
  VERSION = 2
end
