class Robot
  @@robot_names = []

  attr_reader :name

  def initialize
    @name = create_name
    @@robot_names << @name
  end

  def reset
    @@robot_names.delete(name)
    @name = create_name
  end

  private

  def create_name
    new_name = ''

    loop do
      alpha = ('A'..'Z').to_a.sample
      num = ('0'..'9').to_a.sample
      new_name = alpha * 2 + num * 3
      break unless @@robot_names.include?(new_name)
    end
    new_name
  end
end
