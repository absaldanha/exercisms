class SpaceAge
  EARTH_YEAR = 31_557_600.0
  PLANETS_AGES = {
    "mercury" => 0.2408467,
    "venus" => 0.61519726,
    "mars" => 1.8808158,
    "jupiter" => 11.862615,
    "saturn" => 29.447498,
    "uranus" => 84.016846,
    "neptune" => 164.79132
  }

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    seconds / EARTH_YEAR
  end

  PLANETS_AGES.each do |planet, earth_years|
    define_method("on_#{planet}") do
      on_earth / earth_years
    end
  end
end
