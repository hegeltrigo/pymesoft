require 'rails_helper'

RSpec.describe Output, type: :model do
  let(:output) { create(:output) }
    
  it "Its valid with valid attributes" do
    expect(output).to be_valid
  end

  it "Its not valid without item_id" do
    result = Output.new(item_id: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without output_date" do
    result = Output.new(output_date: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without quantity" do
    result = Output.new(quantity: nil)
    expect(result).to_not be_valid
  end
end
