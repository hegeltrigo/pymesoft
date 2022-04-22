require 'rails_helper'

RSpec.describe "treasury/inputs/edit", type: :view do
  before(:each) do
    @treasury_input = assign(:treasury_input, Treasury::Input.create!(
      description: "MyText",
      quantity: "9.99",
      treasury_petty_cash: nil
    ))
  end

  it "renders the edit treasury_input form" do
    render

    assert_select "form[action=?][method=?]", treasury_input_path(@treasury_input), "post" do

      assert_select "textarea[name=?]", "treasury_input[description]"

      assert_select "input[name=?]", "treasury_input[quantity]"

      assert_select "input[name=?]", "treasury_input[treasury_petty_cash_id]"
    end
  end
end
