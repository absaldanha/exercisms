class Binary
  VERSION = 1

  def initialize(binary)
    raise ArgumentError if invalid_input?(binary)
    @binary = binary.reverse.chars
  end

  def to_decimal
    @binary.each_with_index.map { |digit, i| digit.to_i * 2**i }.reduce(:+)
  end

  private

  def invalid_input?(binary)
    binary =~ /[^0-1]/
  end
end
