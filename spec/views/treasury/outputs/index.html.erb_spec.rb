require 'rails_helper'

RSpec.describe "treasury/outputs/index", type: :view do
  before(:each) do
    assign(:treasury_outputs, [
      Treasury::Output.create!(
        description: "MyText",
        quantity: "9.99",
        treasury_petty_cash: nil
      ),
      Treasury::Output.create!(
        description: "MyText",
        quantity: "9.99",
        treasury_petty_cash: nil
      )
    ])
  end

  it "renders a list of treasury/outputs" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
