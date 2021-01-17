# frozen_string_literal: true

# School class
class School
  attr_accessor :students
  def initialize
    @students = {}
  end

  def add(name, grade)
    if students.key?(grade)
      students[grade] << name
    else
      students[grade] = [name]
    end
  end

  def to_h
    sorted_students = students.keys.sort

    sorted_students.map do |grade|
      [grade, students[grade].sort!]
    end.to_h
  end

  def grade(level)
    students.key?(level) ? students[level] : []
  end
end
