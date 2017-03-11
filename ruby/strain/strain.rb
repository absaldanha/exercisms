module Enumerable
  def keep(&block)
    each_with_object([]) { |element, ary| ary << element if yield(element) }
  end

  def discard(&block)
    each_with_object([]) { |element, ary| ary << element unless yield(element) }
  end
end
