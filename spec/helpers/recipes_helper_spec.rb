require 'rails_helper'

RSpec.describe RecipesHelper, type: :helper do
  it 'returns time in hours' do
    expect(helper.time_hrs(Time.parse('2:00'))).to eq('2 hours')
  end

  it "returns plural 'hours' if time greater than 2" do
    expect(helper.time_hrs(Time.parse('2:00'))).to eq('2 hours')
  end

  it "returns singular 'hour' if time less than 1" do
    expect(helper.time_hrs(Time.parse('1:00'))).to eq('1 hour')
  end

  it "returns 'N/A' if time is 0" do
    expect(helper.time_hrs(Time.parse('0:00'))).to eq('N/A')
  end

  it "returns 'N/A' if time is nil" do
    expect(helper.time_hrs(nil)).to eq('N/A')
  end
end
