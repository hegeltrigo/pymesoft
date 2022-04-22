require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :upc => "MyString",
      :sku => "MyString",
      :name => "MyString",
      :description => "MyText",
      :input => 1,
      :output => 1,
      :amount_stock => 1,
      :price => "9.99",
      :cost_price => "9.99",
      :published => false,
      :category => nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[upc]"

      assert_select "input[name=?]", "item[sku]"

      assert_select "input[name=?]", "item[name]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[input]"

      assert_select "input[name=?]", "item[output]"

      assert_select "input[name=?]", "item[amount_stock]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[cost_price]"

      assert_select "input[name=?]", "item[published]"

      assert_select "input[name=?]", "item[category_id]"
    end
  end
end
