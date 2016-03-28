class School
  VERSION = 1

  def initialize
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  # requires ruby 2.3
  def add(new_name, grade)
    index = @grades[grade].bsearch_index { |name| name >= new_name } || -1
    @grades[grade].insert(index, new_name)
  end

  def grade(grade)
    @grades[grade]
  end

  def to_h
    @grades.sort.to_h
  end
end
