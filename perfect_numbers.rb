# perfect_numbers.rb
class PerfectNumber
  def self.classify(input_num)
    raise StandardError if input_num < 0

    sum_of_factors = (1...input_num).select { |n| (input_num % n).zero? }
    sum_of_factors = sum_of_factors.reduce(:+)

    if input_num == sum_of_factors
      'perfect'
    elsif input_num > sum_of_factors
      'deficient'
    elsif input_num < sum_of_factors
      'abundant'
    end
  end
end
