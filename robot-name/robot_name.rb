class Robot
  ALPHABET = ('A'..'Z').to_a
  NUMBERS = ('000'..'999').to_a

  attr_reader :name

  def initialize
    generate_name
  end

  def reset
    generate_name
  end

  private

  def generate_name
    @name = 2.times.map { ALPHABET.sample }.join + NUMBERS.sample
  end
end