class Hamming
  VERSION = 1

  def self.compute(strand1, strand2)
    check_strands strand1, strand2
    calc_distance strand1, strand2
  end

  private

  def self.check_strands(strand1, strand2)
    fail ArgumentError if strand1.length != strand2.length
  end

  def self.calc_distance(strand1, strand2)
    strands_length = strand1.length

    strands_length.times.count do |i|
      strand1[i] != strand2[i]
    end
  end
end
