require 'rails_helper'

RSpec.describe Input, type: :model do
  let(:input) { create(:input) }
  
  it "Its valid with valid attributes" do
    expect(input).to be_valid
  end

  it "Its not valid without item_id" do
    result = Input.new(item_id: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without supplier_id" do
    result = Input.new(supplier_id: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without input_date" do
    result = Input.new(input_date: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without quantity" do
    result = Input.new(quantity: nil)
    expect(result).to_not be_valid
  end

end
