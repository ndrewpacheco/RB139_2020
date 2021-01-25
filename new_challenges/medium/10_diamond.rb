class Diamond
  WHITESPACE = ' '
  NEWLINE = "\n"

  def self.make_diamond(letter)
    ascending_alphabet = descending_alphabet(letter).reverse
    ascending_alphabet.shift
    (descending_alphabet(letter) + ascending_alphabet).join
  end

  def self.descending_alphabet(letter)
    result = 'A'.upto(letter).to_a
    margin_length = result.size
    mid_length = 1
    configure_alphabet(result, margin_length, mid_length)
  end

  def self.configure_alphabet(result, margin_length, mid_length)
    result.map do |char|
      margin_length -= 1
      margin_whitespace = WHITESPACE * margin_length
      mid_whitespace = WHITESPACE * mid_length

      next make_line(char, margin_whitespace) if char == 'A'
      mid_length += 2
      make_line(char, margin_whitespace, mid_whitespace)
    end
  end

  def self.make_line(char, margin_whitespace, mid_whitespace = '')
    if char == 'A'
      margin_whitespace + char + margin_whitespace + NEWLINE
    else
      margin_whitespace +
        char +
        mid_whitespace +
        char +
        margin_whitespace + NEWLINE
    end
  end
end
