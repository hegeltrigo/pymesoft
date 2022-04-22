require 'rails_helper'

RSpec.describe "sales/new", type: :view do
  before(:each) do
    assign(:sale, Sale.new(
      :amount => "9.99",
      :total_amount => "9.99",
      :remaining_amount => "9.99",
      :discount => "9.99",
      :tax => "9.99",
      :customer => nil
    ))
  end

  it "renders new sale form" do
    render

    assert_select "form[action=?][method=?]", sales_path, "post" do

      assert_select "input[name=?]", "sale[amount]"

      assert_select "input[name=?]", "sale[total_amount]"

      assert_select "input[name=?]", "sale[remaining_amount]"

      assert_select "input[name=?]", "sale[discount]"

      assert_select "input[name=?]", "sale[tax]"

      assert_select "input[name=?]", "sale[customer_id]"
    end
  end
end
