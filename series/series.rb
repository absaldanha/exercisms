class Series
  def initialize(string)
    @digits = string.chars.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError unless can_process?(num)
    @digits.each_cons(num).to_a
  end

  private

  def can_process?(num)
    num <= @digits.size
  end
end
