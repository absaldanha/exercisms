class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    valid_trinary? ? decimal_value : 0
  end

  private

  def valid_trinary?
    @trinary !~ /[^0-2]/
  end

  def decimal_value
    digits.each_with_index.map { |digit, i| digit.to_i * 3**i }.reduce(:+)
  end

  def digits
    @trinary.reverse.chars
  end
end
