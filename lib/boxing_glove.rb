require 'punch'
require 'extensions'

class BoxingGlove < Punch
  def self.daily_total(project, date)
    total(project, :after => date.to_time, :before => (date + 1).to_time)
  end
  
  def self.weekly_hours(project, date)
    (date.this_workweek).map do |day| 
      daily_total(project, day)
    end
  end
  
  def self.weekly_total(project, date)
    total(project, :after => date.start_of_workweek.to_time, :before => (date.end_of_workweek + 1).to_time)
  end

  class << self
    public :projects
  end
end
