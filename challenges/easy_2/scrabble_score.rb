# scrabble_score.rb
class Scrabble
  VALUES = {
    /[AEIOULNRST]/ => 1,
    /[DG]/ => 2,
    /[BCMP]/ => 3,
    /[FHVWY]/ => 4,
    /[K]/ => 5,
    /[JX]/ => 8,
    /[QZ]/ => 10
  }.freeze

  def initialize(word)
    @word = word
  end

  def self.score(word)
    new(word).score
  end

  def score
    result = 0
    return result if @word.nil?
    @word.chars.each { |char| result += value(char) if char.match?(/\w/) }
    result
  end

  private

  def value(char)
    VALUES.each do |regex, val|
      return val if char.upcase.match?(regex)
    end
  end
end
