require 'rails_helper'

RSpec.describe SpecificationProduct, type: :model do
  let(:specification_product) {create(:specification_product)}

  it "Its valid with valid attributes" do
    expect(specification_product).to be_valid
  end

  it "Its invalid without item_id" do
    result = SpecificationProduct.new(item_id: nil)
    expect(result).to_not be_valid
  end

  it "Its invalid without specification_value_id" do
    result = SpecificationProduct.new(specification_value_id: nil)
    expect(result).to_not be_valid
  end
end
