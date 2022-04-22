require 'rails_helper'

RSpec.describe "treasury/inputs/show", type: :view do
  before(:each) do
    @treasury_input = assign(:treasury_input, Treasury::Input.create!(
      description: "MyText",
      quantity: "9.99",
      treasury_petty_cash: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
