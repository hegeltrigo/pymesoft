require 'rails_helper'

RSpec.describe "sales/index", type: :view do
  before(:each) do
    assign(:sales, [
      Sale.create!(
        :amount => "9.99",
        :total_amount => "9.99",
        :remaining_amount => "9.99",
        :discount => "9.99",
        :tax => "9.99",
        :customer => nil
      ),
      Sale.create!(
        :amount => "9.99",
        :total_amount => "9.99",
        :remaining_amount => "9.99",
        :discount => "9.99",
        :tax => "9.99",
        :customer => nil
      )
    ])
  end

  it "renders a list of sales" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
