require 'rails_helper'

RSpec.describe Holiday do
  
  it 'exists' do
    data = {
      name: "Christmas Day",
      date: "2020-12-25"
    }
    holiday = Holiday.new(data)

    expect(holiday).to be_a Holiday
    expect(holiday.name).to eq("Christmas Day")
    expect(holiday.date).to eq("2020-12-25")
  end
end