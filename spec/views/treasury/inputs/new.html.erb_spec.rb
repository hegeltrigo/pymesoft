require 'rails_helper'

RSpec.describe "treasury/inputs/new", type: :view do
  before(:each) do
    assign(:treasury_input, Treasury::Input.new(
      description: "MyText",
      quantity: "9.99",
      treasury_petty_cash: nil
    ))
  end

  it "renders new treasury_input form" do
    render

    assert_select "form[action=?][method=?]", treasury_inputs_path, "post" do

      assert_select "textarea[name=?]", "treasury_input[description]"

      assert_select "input[name=?]", "treasury_input[quantity]"

      assert_select "input[name=?]", "treasury_input[treasury_petty_cash_id]"
    end
  end
end
