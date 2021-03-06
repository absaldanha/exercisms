class Integer

  NUMERALS = {
    1000  => 'M',
    900   => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
    90    => 'XC', 50 => 'L',  40 => 'XL', 10 => 'X',
    9     => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I'
  }

  def to_roman
    number = self

    NUMERALS.each_with_object('') do |(key, value), roman|
      (number.div key).times do
        roman << value
        number -= key
      end
    end
  end
end
