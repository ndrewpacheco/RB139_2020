# secret_handshake.rb
class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(num)
    @num = num.to_i
  end

  def commands
    @num = format('%b', @num).chars.reverse
    result_arr = []

    @num.each_with_index do |digit, idx|
      result_arr << COMMANDS[idx] if digit == '1'
    end

    if @num.size > 4
      result_arr.pop
      result_arr.reverse!
    end

    result_arr



  end
end


# handshake = SecretHandshake.new(1)
# puts handshake.commands

# handshake = SecretHandshake.new(2)
# puts handshake.commands


  # def test_handshake_10_to_double_blink
  #   #skip


  # def test_handshake_100_to_close_your_eyes
  #  # skip
  #   handshake = SecretHandshake.new(4)
  #   assert_equal ['close your eyes'], handshake.commands
  # end

  # def test_handshake_1000_to_jump
  #   #skip
  #   handshake = SecretHandshake.new(8)
  #   assert_equal ['jump'], handshake.commands
  # end

  # def test_handshake_11_to_wink_and_double_blink
  #  # skip
  #   handshake = SecretHandshake.new(3)
  #   assert_equal ['wink', 'double blink'], handshake.commands
  # end

  # def test_handshake_10011_to_double_blink_and_wink
  #   #skip
  #   handshake = SecretHandshake.new(19)
  #   assert_equal ['double blink', 'wink'], handshake.commands
  # end
