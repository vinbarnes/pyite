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
  
  def this_workweek
    start_of_workweek..end_of_workweek
  end
  
end

Date.send(:include, DateExtensions)

require 'punch'

class Punch
  class << self
    original_load = self.instance_method(:load)
    # if you want to call the original use:
    #   original_load.bind(self).call
  
    define_method(:load) do |file|
      raise ArgumentError, 'no filename supplied' unless file
      @data = YAML.load(File.read(file))
    end
  end
end
