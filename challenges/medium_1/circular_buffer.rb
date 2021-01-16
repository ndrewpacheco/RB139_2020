# frozen_string_literal: true

# CircularBuffer class
class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  attr_accessor :buffer
  attr_reader :length

  def initialize(length)
    @buffer = Array.new(length)
    @length = length
  end

  def clear
    self.buffer = Array.new(length)
  end

  def read
    validate_empty_buffer

    result = oldest_item
    idx = buffer.find_index(result)
    buffer[idx] = nil
    result
  end

  def write(thing)
    validate_full_buffer

    buffer.shift
    buffer << thing
  end

  def write!(thing)
    return nil if thing.nil?

    if buffer_full?
      buffer.delete(oldest_item)
      buffer << thing
    else
      write(thing)
    end
  end

  private

  def buffer_full?
    buffer.none?(&:nil?) && buffer.size == length
  end

  def oldest_item
    buffer.reject(&:nil?)[0]
  end

  def validate_empty_buffer
    raise BufferEmptyException if buffer.all?(&:nil?)
  end

  def validate_full_buffer
    raise BufferFullException if buffer_full?
  end
end
