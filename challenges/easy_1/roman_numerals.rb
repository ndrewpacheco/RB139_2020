# roman_numerals.rb
class Integer
  ROMAN_LETTERS_1_9 = %w(I II III IV V VI VII VIII IX).freeze
  ROMAN_LETTERS_10_90 = %w(X XX XXX XL L LX LXX LXXX XC).freeze
  ROMAN_LETTERS_100_900 = %w(C CC CCC CD D DC DCC DCCC CM).freeze
  ROMAN_LETTERS_1000_3000 = %w(M MM MMM).freeze
  ROMAN_LETTERS = [
    ROMAN_LETTERS_1_9,
    ROMAN_LETTERS_10_90,
    ROMAN_LETTERS_100_900,
    ROMAN_LETTERS_1000_3000
  ].freeze

  def to_roman
    num_array = to_s.chars.map(&:to_i).reverse
    num_array.map.with_index do |num, idx|
      ROMAN_LETTERS[idx][num - 1] unless num.zero?
    end.reverse.join
  end
end
