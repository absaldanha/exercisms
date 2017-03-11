class Sieve
  attr_reader :primes

  def initialize(limit)
    @primes = []
    find_primes limit
  end

  private

  def find_primes(limit)
    range = Array.new(limit + 1, true)

    2.upto(limit) do |prime|
      if range[prime]
        @primes << prime
        (prime**2).step(by: prime, to: limit) { |x| range[x] = false }
      end
    end
  end
end
