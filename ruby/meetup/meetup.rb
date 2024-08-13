require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    days = get_days(weekday)

    case schedule
    when :first then days.first
    when :second then days[1]
    when :third then days[2]
    when :fourth then days[3]
    when :last then days.last
    when :teenth then days.find { |day| day.mday >= 13 }
    end
  end

  def get_days(weekday)
    1.upto(total_days_in_month)
     .map { |day| Date.new(year, month, day) }
     .select { |day| get_weekday(day) == weekday }
  end

  def total_days_in_month
    Date.new(year, month, -1).day
  end

  def get_weekday(date)
    Date::DAYNAMES[date.wday].downcase.to_sym
  end

  private

  attr_reader :month, :year
end
