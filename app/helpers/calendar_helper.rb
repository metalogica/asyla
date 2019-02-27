module CalendarHelper
  def name_of_month(date)
    I18n.t("date.month_names")[date.month]
  end

  def days_array(date)
    days_array = (1..Time.days_in_month(date.month)).to_a
    Time.new(date.year, date.month, 1).wday.times { days_array.unshift("") }
    return days_array
  end

  def day_classes(date, day)
    classes = ""
    unless day == ''
      classes << "calendar-day"
      classes << " past" if Time.new(date.year, date.month, day).to_date < Time.now.to_date
      classes << " today" if Time.new(date.year, date.month, day).to_date == Time.now.to_date
      classes << " future" if Time.new(date.year, date.month, day).to_date > Time.now.to_date
    end
    return classes
  end

end
