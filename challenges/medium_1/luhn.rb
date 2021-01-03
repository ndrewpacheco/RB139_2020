# luhn.rb
class Luhn
  attr_accessor :num
  def initialize(num)
    @num = num
  end

  def self.create(num)
    luhn = Luhn.new(num)
    luhn.num *= 10
    loop do
      break if luhn.valid?
      luhn.numx += 1
    end
    luhn.num
  end

  def addends
    @num.to_s.chars.reverse.map.with_index do |digit, idx|
      digit = digit.to_i
      if idx.odd?
        digit *= 2
        digit >= 10 ? digit - 9 : digit
      else
        digit
      end
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    (checksum % 10).zero?
  end
end
