require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom Sawyer', email: 'user1@example.com', password: 'password') }
  before(:example) { subject.save }

  it 'is valid' do
    expect(subject).to be_valid
  end

  it 'validates name presence' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates name length' do
    subject.name = 't'
    expect(subject).to_not be_valid
  end

  it 'validates email presence' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'validates password presence' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'validates password length' do
    subject.password = 't'
    expect(subject).to_not be_valid
  end

  describe 'checks method missing_foods_qt' do
    before do
      @mfq = User.first.missing_foods_qt
    end

    it 'should have 1 item' do
      expect(@mfq.count).to eq(2)
    end

    it 'should have be the food created by another user' do
      users = @mfq.keys.map(&:user)
      expect(users).to_not include(User.first)
    end

    it 'should have right quantities' do
      expect(@mfq.values).to match_array([3, 6])
    end
  end
end
