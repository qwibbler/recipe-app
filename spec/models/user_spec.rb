require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Tom Sawyer',
      email: 'user1@example.com',
      password: 'password'
    )
  end

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
      u2 = User.new(name: 'test2', email: 'test2@example.com', password: 'password', created_at: Time.now)

      f1 = Food.create(name: 'Apple', measurement_unit: 'grams', price: 5, user: subject)
      @f2 = Food.create(name: 'Chicken', measurement_unit: 'unit', price: 2, user: u2)

      r1 = Recipe.create(name: 'Recipe 1', public: false, user: subject, description: 'desc')
      r2 = Recipe.create(name: 'Recipe 2', public: true, user: subject, description: 'desc')

      RecipeFood.create(recipe: r1, food: @f2, quantity: 3)

      RecipeFood.create(recipe: r2, food: f1, quantity: 3)
      RecipeFood.create(recipe: r2, food: @f2, quantity: 3)
    end

    it 'should have 1 item' do
      expect(subject.missing_foods_qt.count).to eq(1)
    end

    it 'should have be the food created by another user' do
      expect(subject.missing_foods_qt.first[0]).to eq(@f2)
    end

    it 'should have the quantity 6' do
      expect(subject.missing_foods_qt.keys[0]).to eq(@f2)
    end
  end
end
