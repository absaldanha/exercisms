class Fixnum

  NUMERALS = [
    {
      '1' => 'I',
      '5' => 'V'
    },
    {
      '1' => 'X',
      '5' => 'L'
    },
    {
      '1' => 'C',
      '5' => 'D',
    },
    {
      '1' => 'M'
    }
  ]

  def to_roman
    digits = self.to_s.split('').reverse
    roman = ''
    digits.each_with_index do |digit, index|
      # p roman_numeral(digit, index)
      roman.prepend(roman_numeral(digit, index))
    end

    roman
  end

  def roman_numeral(digit, unit)
    case digit.to_i
    when 0
      ''
    when 1..3
      n = NUMERALS[unit]['1']
      puts "\n#{n}"
      (digit.to_i - 1).times do
        n << NUMERALS[unit]['1']
        puts "\n#{n}"
      end
      n
    when 4
      n = NUMERALS[unit]['1']
      n << NUMERALS[unit]['5']
    when 5
      NUMERALS[unit]['5']
    when 6..8
      n = NUMERALS[unit]['5']
      (digit.to_i - 5).times do
        n << NUMERALS[unit]['1']
      end
    else
      n = NUMERALS[unit]['1']
      n << NUMERALS[unit + 1]['1']
    end
  end
end