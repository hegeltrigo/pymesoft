require 'rails_helper'

RSpec.describe "treasury/outputs/show", type: :view do
  before(:each) do
    @treasury_output = assign(:treasury_output, Treasury::Output.create!(
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
