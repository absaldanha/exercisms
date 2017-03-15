class Bst
  VERSION = 1

  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(value)
    value <= data ? insert_left(value) : insert_right(value)
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    left.each(&block) unless left.nil?
    yield data
    right.each(&block) unless right.nil?
  end

  private

  def insert_left(value)
    left.nil? ? @left = Bst.new(value) : left.insert(value)
  end

  def insert_right(value)
    right.nil? ? @right = Bst.new(value) : right.insert(value)
  end
end
