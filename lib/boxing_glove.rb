require 'punch'
require 'extensions'

class BoxingGlove < Punch
  def self.daily_total(project, date)
    total(project, :after => date.to_time, :before => (date + 1).to_time)
  end
  
  def self.weekly_total(project, date)
    (date.this_workweek).map do |day| 
      daily_total(project, day)
    end
  end
end
