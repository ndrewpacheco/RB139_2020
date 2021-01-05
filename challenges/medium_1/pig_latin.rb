# pig_latin.rb
class PigLatin
  def self.translate(words)
    return words + 'ay' if begins_with_vowel_sounds?(words)

    words = words.split
    words.map do |word|
      prefix = find_prefix(word)
      word + prefix + 'ay'
    end.join(' ')
  end

  def self.begins_with_vowel_sounds?(words)
    words[0].match?(/[aeiou]/) || words[0, 2].match?(/(yt|xr)/)
  end

  def self.find_prefix(word)
    word.match?(/^.*qu/) ? word.slice!(/^.*qu/) : word.slice!(/[^aeiou]+/)
  end
end
