class RunLengthEncoding
  DECODE_REGEX = /(?:(\d*)([[:graph:]]))|(\s+)/

  def self.encode(input)
    chunks = input.chars.chunk { |c| c }
    chunks.inject("") do |encoded, (c, chunk)|
      number = chunk.size > 1 ? chunk.size.to_s : ""
      c == " " ? encoded + chunk.join : encoded + number + c
    end
  end

  def self.decode(input)
    input.scan(DECODE_REGEX).inject("") do |decoded, (count, char, spaces)|
      if spaces.nil?
        number = count.empty? ? 1 : count.to_i
        decoded.concat(char * number)
      else
        decoded + spaces
      end
    end
  end
end

module BookKeeping
  VERSION = 2
end
