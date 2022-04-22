require 'rails_helper'

RSpec.describe Supplier, type: :model do
  let(:supplier) { create(:supplier) }
  
  it "Its valid with valid attributes" do
    expect(supplier).to be_valid
  end

  it "Its not valid without name" do
    result = Supplier.new(name: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without address" do
    result = Supplier.new(address: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without cellphone" do
    result = Supplier.new(cellphone: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid without identifier" do
    result = Supplier.new(identifier: nil)
    expect(result).to_not be_valid
  end

  it "Its not valid with same name" do
    result = Supplier.new(name: supplier.name)
    expect(result).to_not be_valid
  end

  it "Its not valid with same identifier" do
    result = Supplier.new(identifier: supplier.name)
    expect(result).to_not be_valid
  end

end
