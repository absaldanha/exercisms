class Complement
  VERSION = 1

  COMPLEMENT = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(strand)
    strand.chars.inject('') do |strand_complement, nucleotide|
      strand_complement << (COMPLEMENT[nucleotide] || fail(ArgumentError))
    end
  end

  def self.of_rna(strand)
    strand.chars.inject('') do |strand_complement, nucleotide|
      strand_complement << (COMPLEMENT.key(nucleotide) || fail(ArgumentError))
    end
  end
end
