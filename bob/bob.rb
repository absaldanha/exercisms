class Bob
  BLANK = /\A[[:space:]]*\z/
  YELL = /[[:upper:]]+/

  def hey(remark)
    return 'Whoa, chill out!' if yell? remark
    return 'Sure.' if question? remark
    return 'Fine. Be that way!' if nothing_said? remark
    'Whatever.'
  end

  private

  def question?(remark)
    remark.end_with? '?'
  end

  def yell?(remark)
    YELL === remark && remark == remark.upcase
  end

  def nothing_said?(remark)
    BLANK === remark
  end
end