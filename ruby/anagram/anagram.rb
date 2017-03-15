class Anagram
  attr_reader :word, :word_letters, :word_length

  def initialize(word)
    @word = word.downcase
    @word_letters = @word.chars.sort
    @word_length = @word.length
  end

  def match(candidates)
    candidates.each_with_object([]) do |candidate, result|
      next if word.casecmp(candidate).zero?
      result << candidate if anagram?(candidate.downcase)
    end
  end

  private

  def anagram?(candidate)
    return unless candidate.length == word_length
    candidate.chars.sort == word_letters
  end
end

module BookKeeping
  VERSION = 2
end
