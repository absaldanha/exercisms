class School
  VERSION = 1

  def initialize
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def add(name, grade)
    @grades[grade] << name
  end

  def grade(grade)
    @grades[grade].sort
  end

  def to_h
    @grades.each_value { |names| names.sort! }
    Hash[@grades.sort]
  end
end
