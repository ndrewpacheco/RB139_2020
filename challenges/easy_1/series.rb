class Series
  def initialize(digits)
    @digits = digits.split('').map(&:to_i)
  end

  def slices(amount)
    max_idx = @digits.size - amount
    result = []

    raise ArgumentError if amount > @digits.size
    @digits.each_index do |idx|
      result << @digits[idx, amount] unless idx > max_idx
    end
    result
  end
end
