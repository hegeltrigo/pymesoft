require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { create(:item) }
  
  it "Its valid with valid attributes" do
    expect(item).to be_valid
  end

  it "Its not valid without name" do
    result = Item.new(name: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid with same name" do
    result = Item.new(name: item.name)
    expect(result).to_not be_valid
  end

  it "Its not valid with same sku" do
    result = Item.new(sku: item.sku)
    expect(result).to_not be_valid
  end

  it "Its not valid without sku" do
    result = Item.new(sku: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without price" do
    result = Item.new(price: nil)
    expect(result).to_not be_valid
  end

  it "has a valid factory" do
      expect(item).to be_valid
  end
end
