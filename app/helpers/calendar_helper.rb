module CalendarHelper
  def name_of_month(date)
    I18n.t("date.month_names")[date.month]
  end

  def year(date)
    date.year
  end

  def tasks_hash(date, tasks)
    tasks_hash = {}
    tasks.each do |task|
      deadline = task.deadline;
      if deadline.month == date.month && deadline.year == date.year
        if tasks_hash.key?(deadline.day)
          tasks_hash[deadline.day] << task
        else
          tasks_hash[deadline.day] = [task]
        end
      end
    end

    return tasks_hash
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
