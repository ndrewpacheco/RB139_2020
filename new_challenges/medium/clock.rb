class Clock
  MINS_IN_HOUR = 60
  MINS_IN_DAY = 1440

  def initialize(total)
    convert_time(total)
  end

  def convert_time(total)
    @total = total
    @total %= MINS_IN_DAY
    @hours = @total / MINS_IN_HOUR
    @minutes = @total % MINS_IN_HOUR
  end

  def self
    @total
  end

  def self.at(hours, minutes = 0)
    total = (hours * MINS_IN_HOUR) + minutes
    Clock.new(total)
  end

  def to_s
    convert_time(@total)
    "#{format('%02d', @hours)}:#{format('%02d', @minutes)}"
  end

  def +(other)
    @total += other
    self
  end

  def -(other)
    @total -= other
    self
  end

  def ==(other)
    to_s == other.to_s
  end
end
