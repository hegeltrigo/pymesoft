require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :upc => "Upc",
        :sku => "Sku",
        :name => "Name",
        :description => "MyText",
        :input => 2,
        :output => 3,
        :amount_stock => 4,
        :price => "9.99",
        :cost_price => "9.99",
        :published => false,
        :category => nil
      ),
      Item.create!(
        :upc => "Upc",
        :sku => "Sku",
        :name => "Name",
        :description => "MyText",
        :input => 2,
        :output => 3,
        :amount_stock => 4,
        :price => "9.99",
        :cost_price => "9.99",
        :published => false,
        :category => nil
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Upc".to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
