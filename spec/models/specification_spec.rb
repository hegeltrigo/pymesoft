require 'rails_helper'

RSpec.describe Specification, type: :model do
  let(:specification) {{ name: Faker::Beer.name }}

  it "Its valid with valid attributes" do
    result = Specification.new(specification)
    expect(result).to be_valid
  end

  it "Its invalid without name" do
    result = Specification.new(name: nil)
    expect(result).to_not be_valid
  end

end
