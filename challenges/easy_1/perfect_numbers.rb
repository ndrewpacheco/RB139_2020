# perfect_numbers.rb
require 'prime'

class PerfectNumber
  def self.find_category(input_num, sum_of_factors)
    if input_num == sum_of_factors
      'perfect'
    elsif input_num > sum_of_factors
      'deficient'
    elsif input_num < sum_of_factors
      'abundant'
    end
  end

  def self.classify(input_num)
    raise StandardError if input_num < 0
    return 'deficient' if Prime.prime?(input_num)

    sum_of_factors = (1...input_num).select do |n|
      (input_num % n).zero?
    end.reduce(:+)

    find_category(input_num, sum_of_factors)
  end
end
