class Phrase
  VERSION = 1

  attr_reader :word_count

  WORD_REGEX = /\w+(?:'\w+)?/

  def initialize(phrase)
    @word_count = Hash.new(0)
    count_words(phrase.downcase)
  end

  private

  def count_words(phrase)
    phrase.scan(WORD_REGEX).each do |word|
      @word_count[word] += 1
    end
  end
end