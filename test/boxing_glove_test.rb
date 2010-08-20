require File.dirname(__FILE__) + '/helper'
require 'boxing_glove'

class BoxingGloveTest < Test::Unit::TestCase
  it 'is' do
    assert BoxingGlove
  end
  
  describe 'BoxingGlove' do
    it 'wraps Punch' do
      assert BoxingGlove.respond_to?(:load)
    end
  end

  it 'defines BoxingGlove.daily_total' do
    assert BoxingGlove.respond_to?(:daily_total)
  end
  
  describe 'BoxingGlove.daily_total' do
    setup do
      test_file = File.expand_path(File.dirname(__FILE__) + '/test_punch.yml')
      BoxingGlove.load(test_file)
      @today = Date.new(2010, 8, 2)
    end
    
    it 'accepts a project argument' do
      assert_nothing_raised { BoxingGlove.daily_total('pet', Date.today) }
    end
    
    it 'accepts a date argument' do
      assert_nothing_raised { BoxingGlove.daily_total(nil, Date.today) }      
    end
    
    it 'requires a project argument' do
      assert_raises(ArgumentError) { BoxingGlove.daily_total(Date.today) }
    end

    it 'requires a date argument' do
      assert_raises(ArgumentError) { BoxingGlove.daily_total('pet') }
    end

    it 'returns zero if no hours for the given project on the given day' do
      assert_equal 0, BoxingGlove.daily_total('pet', @today - 5)
    end

    it 'returns the total hours for the given project on the given day' do
      assert_equal 36000, BoxingGlove.daily_total('pet', @today)
    end
  end

  it 'defines BoxingGlove.weekly_total' do
    assert BoxingGlove.respond_to?(:weekly_total)
  end

  describe 'BoxingGlove.weekly_total' do
    setup do
      test_file = File.expand_path(File.dirname(__FILE__) + '/test_punch.yml')
      BoxingGlove.load(test_file)
      @today = Date.new(2010, 8, 2)
    end
    
    it 'accepts a project argument' do
      assert_nothing_raised { BoxingGlove.weekly_total('pet', Date.today) }
    end
    
    it 'accepts a date argument' do
      assert_nothing_raised { BoxingGlove.weekly_total(nil, Date.today) }      
    end
    
    it 'requires a project argument' do
      assert_raises(ArgumentError) { BoxingGlove.weekly_total(Date.today) }
    end

    it 'requires a date argument' do
      assert_raises(ArgumentError) { BoxingGlove.weekly_total('pet') }
    end
    
    it 'returns a list of hours for each workday for the given project' do
      assert_equal [0, 0, 0, 0, 0, 0, 0], BoxingGlove.weekly_total('pet', @today - 1)
      assert_equal [36000, 0, 0, 0, 0, 0, 36000], BoxingGlove.weekly_total('pet', @today)
    end
  end

  it 'defines BoxingGlove.projects' do
    assert BoxingGlove.respond_to?(:projects)
  end

  describe 'BoxingGlove.projects' do
    it 'returns a list of projects' do
      test_file = File.expand_path(File.dirname(__FILE__) + '/test_punch.yml')
      BoxingGlove.load(test_file)
      assert_equal ['pet'], BoxingGlove.projects
    end
  end
end
