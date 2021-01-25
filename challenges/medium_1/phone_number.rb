class PhoneNumber
  INVALID_NUMBER = '0000000000'.freeze

  def initialize(phone_number)
    @phone_number = configure(phone_number)
    @phone_number.delete_prefix!('1') if eleven_digits_and_starts_with_one?
  end

  def number
    return INVALID_NUMBER if invalid_number?

    @phone_number
  end

  def area_code
    @phone_number[0..2]
  end

  def to_s
    "(#{area_code}) #{@phone_number[3..5]}-#{@phone_number[6..9]}"
  end

  private

  def configure(phone_number)
    phone_number.chars.select do |digit|
      digit.match?(/\w/)
    end.join
  end

  def eleven_digits_and_starts_with_one?
    @phone_number.size == 11 && @phone_number[0] == '1'
  end

  def invalid_number?
    @phone_number.size < 10 ||
      (@phone_number.size == 11 && @phone_number[0] != '1') ||
      @phone_number.size > 11 ||
      @phone_number.match?(/[^\d]/)
  end
end
