class Octal
  BASE = 8

  def initialize(num)
    @num = num
  end

  def prepared_num
    @num.split("").reverse.map(&:to_i)
  end

  def num_invalid?
    @num.match?(/[^0-7]/)
  end

  def to_decimal
    return 0 if num_invalid?

    result = 0
    prepared_num.each_with_index do |num, idx|
      result += num * (BASE**idx)
    end
    result
  end
end
