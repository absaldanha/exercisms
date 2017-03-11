class Prime
  def self.nth(n)
    fail ArgumentError if n.zero?

    primes = [2]

    3.step(by: 2) do |x|
      return primes.last if primes.size == n
      primes_to_test = primes.lazy.take_while { |prime| prime <= Math.sqrt(x) }
      primes << x unless primes_to_test.any? { |prime| x % prime == 0 }
    end
  end
end