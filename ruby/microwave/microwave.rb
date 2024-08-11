class Microwave
  def initialize(buttons)
    button_minutes = buttons / 100
    button_seconds = buttons % 100
    @total_seconds = button_minutes * 60 + button_seconds
  end

  def timer
    format('%<minutes>02d:%<seconds>02d',
           minutes: total_seconds / 60, seconds: total_seconds % 60)
  end

  private

  attr_reader :total_seconds
end
