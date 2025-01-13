require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    category = FactoryBot.create(:category)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(name: nil, description: 'This is a description')
    expect(category).to_not be_valid
  end

  it 'is not valid without a description' do
    category = Category.new(name: 'Category', description: nil)
    expect(category).to_not be_valid
  end

  it 'is not valid with a name shorter than 3 characters' do
    category = Category.new(name: 'Ca', description: 'This is a description')
    expect(category).to_not be_valid
  end

  it 'is not valid with a name longer than 50 characters' do
    category = Category.new(name: 'a' * 51, description: 'This is a description')
    expect(category).to_not be_valid
  end

  it 'is not valid with a description shorter than 10 characters' do
    category = Category.new(name: 'Category', description: 'This is a')
    expect(category).to_not be_valid
  end

  it 'is not valid with a description longer than 300 characters' do
    category = Category.new(name: 'Category', description: 'a' * 301)
    expect(category).to_not be_valid
  end
end
