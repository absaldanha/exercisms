class Array
  def accumulate
    ary = []
    i = 0

    while i <= size - 1
      ary << yield(at(i))
      i += 1
    end

    ary
  end
end
