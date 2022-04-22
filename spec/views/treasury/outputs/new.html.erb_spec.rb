require 'rails_helper'

RSpec.describe "treasury/outputs/new", type: :view do
  before(:each) do
    assign(:treasury_output, Treasury::Output.new(
      description: "MyText",
      quantity: "9.99",
      treasury_petty_cash: nil
    ))
  end

  it "renders new treasury_output form" do
    render

    assert_select "form[action=?][method=?]", treasury_outputs_path, "post" do

      assert_select "textarea[name=?]", "treasury_output[description]"

      assert_select "input[name=?]", "treasury_output[quantity]"

      assert_select "input[name=?]", "treasury_output[treasury_petty_cash_id]"
    end
  end
end
