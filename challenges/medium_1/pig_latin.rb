# frozen_string_literal: true

# PigLatin class
class PigLatin
  AY = 'ay'

  def self.translate(words)
    return words + AY if begins_with_vowel_sounds?(words)

    words = words.split
    words.map do |word|
      word = word.clone
      prefix = find_prefix(word)
      word + prefix + AY
    end.join(' ')
  end

  def self.begins_with_vowel_sounds?(words)
    words[0].match?(/[aeiou]/) || words[0, 2].match?(/(yt|xr)/)
  end

  def self.find_prefix(word)
    word.match?(/^.*qu/) ? word.slice!(/^.*qu/) : word.slice!(/[^aeiou]+/)
  end
end
