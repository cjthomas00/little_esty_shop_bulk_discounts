require 'rails_helper'

RSpec.describe HolidayFacade do

  it "can get all holidays" do
    holidays = HolidayFacade.all_holidays
    expect(holidays[0]).to be_a Holiday
    expect(holidays[0].name).to be_a String
    expect(holidays[0].date).to be_a String
  end

  it 'can get next three holidays' do
    next_three_holidays = HolidayFacade.next_three_holidays

    test_data = next_three_holidays.map do |holiday|
      holiday.date != Date.today 
    end
    expect(test_data).to eq([true, true, true])
    expect(next_three_holidays.count).to eq(3)
  end
end