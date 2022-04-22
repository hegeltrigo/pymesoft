require 'rails_helper'

RSpec.describe "sales/edit", type: :view do
  before(:each) do
    @sale = assign(:sale, Sale.create!(
      :amount => "9.99",
      :total_amount => "9.99",
      :remaining_amount => "9.99",
      :discount => "9.99",
      :tax => "9.99",
      :customer => nil
    ))
  end

  it "renders the edit sale form" do
    render

    assert_select "form[action=?][method=?]", sale_path(@sale), "post" do

      assert_select "input[name=?]", "sale[amount]"

      assert_select "input[name=?]", "sale[total_amount]"

      assert_select "input[name=?]", "sale[remaining_amount]"

      assert_select "input[name=?]", "sale[discount]"

      assert_select "input[name=?]", "sale[tax]"

      assert_select "input[name=?]", "sale[customer_id]"
    end
  end
end
