module CalendarHelper
  def name_of_month(date)
    I18n.t("date.month_names")[date.month]
  end

  def year(date)
    date.year
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

  def tasks_hash(date, tasks)
    tasks_hash = {}
    tasks.each do |task|
      deadline = task.deadline
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

  def next_five_tasks(tasks)
    next_five = tasks.to_a.sort {| task1, task2 | task1.deadline <=> task2.deadline }
    next_five.first(5).map! do |task| 
      days_away = (task.deadline - DateTime.today).to_i
      return [task, days_away]
    end
    return next_five
  end

end
