class Trinary
  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def invalid_trinary?
    @trinary_string.match?(/[^012]/)
  end

  def to_decimal
    return 0 if invalid_trinary?
    @trinary_string
      .chars
      .reverse
      .map
      .with_index do |item, idx|
        item.to_i * (3**idx)
      end.reduce(:+)
  end
end
