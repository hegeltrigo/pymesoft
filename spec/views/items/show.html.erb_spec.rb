require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Upc/)
    expect(rendered).to match(/Sku/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
