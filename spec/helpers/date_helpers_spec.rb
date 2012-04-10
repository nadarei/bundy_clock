require 'spec_helper'

describe 'DateHelpers' do
  include DateHelpers

  describe '#range_for_month_with' do
    it 'should work for 2011-03-24' do
      date = Date.parse('2011-03-24')

      range = range_for_month_with(date)

      range.begin.should == Date.parse('2011-03-01')
      range.end.should == Date.parse('2011-03-31')
    end

    it 'should cap to the current date' do
      date = Date.today

      range = range_for_month_with(date)

      range.end.should == Date.today
    end
  end
end
