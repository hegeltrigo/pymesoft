require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }
  it "Its valid with valid attributes" do
    expect(category).to be_valid
  end

  it "Its valid with parent_id" do
    result = Category.new(parent_id: 1, name:Faker::Beer.name, description:Faker::Beer.brand)
    expect(result).to be_valid
  end
  
  it "Its not valid without name" do
    result = Category.new(name: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without description" do
    result = Category.new(description: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid with same name" do
    result = Category.new(name: category.name)
    expect(result).to_not be_valid
  end

end
