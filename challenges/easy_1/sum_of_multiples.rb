class SumOfMultiples
  DEFAULT_MULTIPLES = [3, 5]

  def initialize(*multiples)
    @multiples = multiples.empty? ? DEFAULT_MULTIPLES : multiples
  end

  def self.to(max_num)
    new.to(max_num)
  end

  def to(max_num)
    sum_of_multiples(@multiples, max_num)
  end

  private

  def sum_of_multiples(arr, max_num)
    range = (0...max_num).to_a
    range.select do |range_num|
      arr.any? { |multiple| range_num % multiple == 0 }
    end.reduce(:+)
  end
end
