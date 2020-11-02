class Anagram
  attr_reader :master_word

  def initialize(master_word)
    @master_word = master_word.downcase
  end

  def prep(word)
    word.downcase.chars.sort.join
  end

  def match(words)
    words.select do |word|
      next if word.downcase == master_word
      prep(word) == prep(master_word)
    end
  end
end
