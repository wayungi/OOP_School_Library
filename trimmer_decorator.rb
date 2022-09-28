require './base_decorator'

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name[0...10]
  end
end
