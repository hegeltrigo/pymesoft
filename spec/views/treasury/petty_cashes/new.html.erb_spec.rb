require 'rails_helper'

RSpec.describe "treasury/petty_cashes/new", type: :view do
  before(:each) do
    assign(:treasury_petty_cash, Treasury::PettyCash.new())
  end

  it "renders new treasury_petty_cash form" do
    render

    assert_select "form[action=?][method=?]", treasury_petty_cashes_path, "post" do
    end
  end
end
