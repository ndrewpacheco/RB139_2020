# word_count.rb
class Phrase
  def initialize(words)
    @words = words.chars.map do |char|
      char.match?(/[a-z0-9\s\'\"]/i) ? char : ' '
    end.join
  end

  def word_count
    counts = Hash.new(0)
    @words.split.each do |word|
      word = word.match(/\b.+\b/).to_s.downcase
      counts[word] += 1
    end
    counts
  end
end
