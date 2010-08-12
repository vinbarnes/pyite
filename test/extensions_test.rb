require File.dirname(__FILE__) + '/helper'
require 'extensions'

class ExtensionsTest < Test::Unit::TestCase
  it 'has DateExtensions included by Date' do
    assert Date.ancestors.include?(DateExtensions)
  end

  describe 'Date extensions' do
    it 'defines Date#to_time' do
      assert Date.new.respond_to?(:to_time)
    end

    describe 'Date#to_time' do
      it 'converts a Date to a Time' do
        time = Date.today.to_time
        assert_equal Time, time.class
      end
      
      it 'has a time of 00:00:00' do
        time = Date.today.to_time
        assert_equal 0, time.hour
        assert_equal 0, time.min
        assert_equal 0, time.sec
      end
    end
    
    it 'defines Date#start_of_week' do
      assert Date.new.respond_to?(:start_of_week)
    end

    describe 'Date#start_of_week' do
      it 'returns a Date' do
        today = Date.today
        assert_equal Date, today.start_of_week.class
      end
      
      it 'returns the Date representing the start of the commercial week' do
        date = Date.new(2010, 8, 7)
        assert_equal Date.new(2010, 8, 2), date.start_of_week
      end
    end
    
    it 'defines Date#end_of_week' do
      assert Date.new.respond_to?(:end_of_week)
    end

    describe 'Date#end_of_week' do
      it 'returns a Date' do
        today = Date.today
        assert_equal Date, today.end_of_week.class
      end
      
      it 'returns the Date representing the end of the commercial week' do
        date = Date.new(2010, 8, 7)
        assert_equal Date.new(2010, 8, 8), date.end_of_week
      end
    end
    
  end
end
