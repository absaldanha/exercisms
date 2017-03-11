class Pangram
  VERSION = 4

  ALPHABET = ("a".."z").to_a

  def self.pangram?(phrase)
    letters = get_letters_from phrase
    (ALPHABET - letters.uniq).empty?
  end

  def self.get_letters_from(phrase)
    downcase = phrase.downcase
    downcase.scan(/[[:alpha:]]/)
  end

  private_class_method :get_letters_from
end
