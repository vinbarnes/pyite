require 'date'
require 'time'

module DateExtensions
  def to_time
    Time.parse(self.to_s)
  end

  def start_of_workweek
    self - (self.cwday - 1)
  end
  
  def end_of_workweek
    self.start_of_workweek + 6
  end
  
  def this_week
    start_of_workweek..end_of_workweek
  end
  
end

Date.send(:include, DateExtensions)
