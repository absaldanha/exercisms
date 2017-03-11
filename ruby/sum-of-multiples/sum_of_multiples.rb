class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(max)
    self.class.to(max, @numbers)
  end

  def self.to(max, numbers = [3, 5])
    multiples = numbers.flat_map do |x|
                  x.step(by: x, to: max - 1).to_a
                end

    multiples.uniq.reduce(:+) || 0
  end
end
