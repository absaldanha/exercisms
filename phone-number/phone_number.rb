class PhoneNumber
  CLEAR_REGEX = /\s|[[:punct:]]/

  attr_reader :number

  def initialize(phone)
    @phone = phone
    process_number
  end

  def area_code
    @number[0..2]
  end

  def to_s
    "(#{area_code}) #{exchange_code}-#{subscriber_number}"
  end

  private

  def process_number
    clear_phone
    @number = valid_phone? ? @phone : "0000000000"
  end

  def clear_phone
    @phone.gsub!(CLEAR_REGEX, "")
  end

  def valid_phone?
    only_numbers? && valid_length?
  end

  def only_numbers?
    @phone !~ /\D/
  end

  def valid_length?
    if @phone.length == 10
      true
    elsif @phone.length == 11 && @phone.start_with?("1")
      @phone = @phone[1..-1]
    end
  end

  def exchange_code
    @number[3..5]
  end

  def subscriber_number
    @number[6..-1]
  end
end
