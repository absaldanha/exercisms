class Crypto
  attr_reader :plaintext

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def normalize_plaintext
    @normalize_plaintext ||= plaintext.gsub(/[^[:alnum:]]/, "").downcase
  end

  def plaintext_segments
    normalize_plaintext.scan /.{1,#{width}}/
  end

  def ciphertext
    transposed_chunks.join
  end

  def normalize_ciphertext
    transposed_chunks.map { |chunk| chunk.join }.join(" ")
  end

  def width
    @width ||= calculate_width
  end
  alias_method :size, :width

  def height
    @height ||= calculate_height
  end

  private

  def calculate_width
    height * height >= normalized_plaintext_length ? height : height + 1
  end

  def calculate_height
    (Math.sqrt(normalized_plaintext_length + 0.25) - 0.5).ceil
  end

  def normalized_plaintext_length
    @normalized_plaintext_length ||= normalize_plaintext.length
  end

  def transposed_chunks
    normalize_plaintext_chunks.transpose
  end

  def normalize_plaintext_chunks
    plaintext_segments.map do |segment|
      Array.new(width) { |i| segment.chars[i] }
    end
  end
end
