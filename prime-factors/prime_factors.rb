require "prime"

class PrimeFactors
  class << self
    def for(number)
      factors = []
      limit = Math.sqrt(number).floor

      Prime.each(limit) do |prime|
        break if number <= prime

        while number.remainder(prime).zero?
          factors << prime
          number /= prime
        end
      end

      factors << number if number > 1

      factors
    end
  end
end
