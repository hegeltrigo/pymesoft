require 'rails_helper'

RSpec.describe SpecificationValue, type: :model do
  let(:specification) {create(:specification)}
  let(:specification_value) {{ value: Faker::Beer.name, specification_id: specification.id }}

  it "Its valid with valid attributes" do
    result = SpecificationValue.new(specification_value)
    expect(result).to be_valid
  end

  it "Its invalid without value" do
    result = SpecificationValue.new(value: nil)
    expect(result).to_not be_valid
  end
end
