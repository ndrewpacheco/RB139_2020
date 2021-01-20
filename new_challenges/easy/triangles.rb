class Triangle
  attr_reader :sides

  def initialize(*sides)
    @sides = sides
    @total_length = sides.reduce(:+)
    validate_sides
  end

  def validate_sides
    raise ArgumentError if sides.any? { |side| side <= 0 }

    sides.each do |side|
      raise ArgumentError unless (@total_length - side) >= side
    end
  end

  def kind
    case sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end
end
