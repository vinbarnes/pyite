require 'date'
require 'time'

module DateExtensions
  def to_time
    Time.parse(self.to_s)
  end

  def start_of_work_week
    self - (self.cwday - 1)
  end
  
  def end_of_work_week
    self.start_of_work_week + 6
  end
end

Date.send(:include, DateExtensions)
