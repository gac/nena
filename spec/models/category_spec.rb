require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(50) }

    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(5).is_at_most(100) }
  end

  describe 'invalid category' do
    let(:category) { Category.new }

    it 'is not valid without a name' do
      expect(category).not_to be_valid
      expect(category.errors[:name]).not_to be_empty
    end

    it 'is not valid without a description' do
      expect(category).not_to be_valid
      expect(category.errors[:description]).not_to be_empty
    end
  end

  describe 'valid category' do
    let(:category) { Category.new(name: 'Test Category', description: 'This is a test category') }

    it 'is valid with a name and description' do
      expect(category).to be_valid
    end
  end
end
