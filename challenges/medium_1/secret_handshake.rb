# secret_handshake.rb
ONE = "1"
ZERO = "0"
COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

class SecretHandshake
  def initialize(num)
    @num = num.to_i
  end

  def commands
    binary_arr = []
    binary_num = @num
    commands_arr = []

    # first determine size of binary arr
    counter = 0
    loop do
      break if @num / 2**counter == 0
      counter += 1
      binary_arr << nil
    end

    binary_arr.map!.with_index do |item, idx|
      counter -= 1
      if binary_num / 2**counter == 1
        binary_num -= 2**counter
        ONE
      else
        ZERO
      end
    end

    binary_arr.reverse.each_with_index do |digit, idx|
      commands_arr << COMMANDS[idx] if digit == '1'
    end

    if binary_arr.size > 4
      commands_arr.reject!(&:nil?)
      commands_arr.reverse!
    end
    commands_arr
  end

  # my first answer without manually converting integer to binary:

  #   @num = format('%b', @num).chars.reverse
  #   result_arr = []

  #   @num.each_with_index do |digit, idx|
  #     result_arr << COMMANDS[idx] if digit == '1'
  #   end

  #   if @num.size > 4
  #     result_arr.reject!(&:nil?)
  #     result_arr.reverse!
  #   end

  #   result_arr
  # end
end


handshake = SecretHandshake.new(19)
p handshake.commands

handshake = SecretHandshake.new(31)
p handshake.commands


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
