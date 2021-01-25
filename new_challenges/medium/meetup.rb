require 'date'
class Meetup
  LEAP_YEAR = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  REGULAR_YEAR = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  DOWM = {
    'first' => (1..7).to_a,
    'second' => (8..14).to_a,
    'third' => (15..21).to_a,
    'fourth' => (22..28).to_a,
    'fifth' => (29..31).to_a,
    'teenth' => (13..19).to_a
  }

  attr_reader :days_in_month

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = leap_year? ? LEAP_YEAR[month - 1] : REGULAR_YEAR[month - 1]
  end

  def leap_year?
    Date.leap?(@year)
  end

  def last_days
    ((@days_in_month - 7)..@days_in_month).to_a.reverse
  end

  def day(weekday, schedule)
    weekday.downcase!
    weekday += '?'
    schedule.downcase!
    days = schedule == 'last' ? last_days : DOWM[schedule]
    find_day(days, weekday)
    valid_date?(@day_number) ? Date.civil(@year, @month, @day_number) : nil
  end

  def find_day(days, weekday)
    days.each do |num|
      return nil unless valid_date?(num)

      if Date.new(@year, @month, num).send(weekday)
        @day_number = num
        break
      end
    end
  end

  def valid_date?(day_number)
    Date.valid_date?(@year, @month, day_number)
  end
end
