class Grains
  def self.square(n)
    1 * 2**(n - 1)
  end

  def self.total
    2**64 - 1
  end
end