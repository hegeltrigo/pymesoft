require 'rails_helper'

RSpec.describe "treasury/outputs/edit", type: :view do
  before(:each) do
    @treasury_output = assign(:treasury_output, Treasury::Output.create!(
      description: "MyText",
      quantity: "9.99",
      treasury_petty_cash: nil
    ))
  end

  it "renders the edit treasury_output form" do
    render

    assert_select "form[action=?][method=?]", treasury_output_path(@treasury_output), "post" do

      assert_select "textarea[name=?]", "treasury_output[description]"

      assert_select "input[name=?]", "treasury_output[quantity]"

      assert_select "input[name=?]", "treasury_output[treasury_petty_cash_id]"
    end
  end
end
