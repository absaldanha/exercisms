class Bob
  def hey(remark)
    return 'Whoa, chill out!' if yell? remark
    return 'Sure.' if question? remark
    return 'Fine.' if nothing_said? remark
    'Whatever.'
  end

  private

  def question?(remark)
    remark.end_with? '?'
  end

  def yell?(remark)
    remark == remark.upcase
  end

  def nothing_said?(remark)
    remark.empty?
  end
end