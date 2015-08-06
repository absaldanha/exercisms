class Raindrops
  VERSION = 1

  DROP = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }

  def self.convert(number)
    divisors = DROP.each_key.select { |n| number % n == 0 }
    divisors.empty? ? number.to_s : divisors.inject('') { |conv, n| conv << DROP[n] }
  end
end
