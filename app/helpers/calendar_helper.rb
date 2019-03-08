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
      classes << " active" if day == date.day
    end
    return classes
  end

  def tasks_hash(date, tasks)
    tasks_hash = {}
      tasks.each do |task|
        unless task.deadline.nil?
          deadline = task.deadline
          deadline = task.start unless task.start.nil?
          if deadline.month == date.month && deadline.year == date.year
            if tasks_hash.key?(deadline.day)
              tasks_hash[deadline.day] << task
            else
              tasks_hash[deadline.day] = [task]
            end
          end
        end
    end
    return tasks_hash
  end

  def appointments_this_week(tasks)
    tasks_sorted = tasks.to_a.sort {| task1, task2 | task1.deadline <=> task2.deadline }
    tasks_sorted.select! { |task| task.deadline >= Time.now.beginning_of_day }
    tasks_sorted.select! { |task| task.deadline <= Time.now.beginning_of_day.next_day(7) }
    this_week = tasks_sorted.map do |task| 
      days_away = (task.deadline - Time.now)/(60*60*24)
      days_away = days_away.ceil
      [task, days_away]
    end
    return this_week
  end

end
