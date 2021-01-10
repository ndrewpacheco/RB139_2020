# frozen_string_literal: true

# secret_handshake.rb
class SecretHandshake
  ONE = '1'
  ZERO = '0'
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(num)
    @num = num.to_i
    @binary_num = @num
  end

  def commands
    commands_arr = []

    binary_arr.reverse.each_with_index do |digit, idx|
      commands_arr << COMMANDS[idx] if digit == '1'
    end

    if binary_arr.size > 4
      commands_arr.reject!(&:nil?)
      commands_arr.reverse!
    end
    commands_arr

    #   my first draft without manually converting integer to binary:

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
    #   end
  end

  private

  def find_size
    counter = 0
    loop do
      break if (@num / 2**counter).zero?

      counter += 1
    end
    counter
  end

  def fill(binary_arr)
    counter = find_size
    while counter.positive?
      counter -= 1
      if @binary_num / 2**counter == 1
        @binary_num -= 2**counter
        binary_arr << ONE
      else
        binary_arr << ZERO
      end
    end
  end

  def binary_arr
    binary_arr = []
    fill(binary_arr)
    binary_arr
  end
end
