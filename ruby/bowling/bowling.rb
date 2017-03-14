require_relative "bowling_error"
require_relative "policy"
require_relative "frame"
require "observer"

class Game
  include Observable

  attr_reader :frames, :frame_position, :policy

  def initialize
    @frame_position = 0
    @frames = Array.new(10) { |index| Frame.new(index) }
    @policy = Game::Policy.new
  end

  def roll(pins)
    verify_roll(pins)
    changed
    account_for_current_frame(pins)
    notify_observers(pins)
    account_new_observers
    advance_frame
  end

  def score
    fail Game::BowlingError unless policy.show_score?(current_frame)
    frames.sum(&:score)
  end

  private

  def verify_roll(pins)
    policy.valid_roll?(pins, current_frame)
  end

  def account_for_current_frame(pins)
    current_frame.add_throw(pins) unless current_frame.finished?
  end

  def account_new_observers
    add_observer(current_frame) if observer_frame?
  end

  def advance_frame
    next_frame if current_frame.finished?
  end

  def current_frame
    frames[frame_position]
  end

  def observer_frame?
    current_frame.strike? || current_frame.spare?
  end

  def next_frame
    @frame_position += 1 unless @frame_position == 9
  end
end

module BookKeeping
  VERSION = 3
end
