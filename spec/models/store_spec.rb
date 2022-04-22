require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) { 
    {name: Faker::Name.name, description: Faker::Company.bs} 
  }
    
  it "Its valid with valid attributes" do
    result = Store.new(store)
    expect(result).to be_valid
  end

  it "Its not valid without name" do
    result = Store.new(name: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without description" do
    result = Store.new(description: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid with same name" do
    result = Store.new(name: store[:name])
    expect(result).to_not be_valid
  end
end
