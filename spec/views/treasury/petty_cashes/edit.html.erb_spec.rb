require 'rails_helper'

RSpec.describe "treasury/petty_cashes/edit", type: :view do
  before(:each) do
    @treasury_petty_cash = assign(:treasury_petty_cash, Treasury::PettyCash.create!())
  end

  it "renders the edit treasury_petty_cash form" do
    render

    assert_select "form[action=?][method=?]", treasury_petty_cash_path(@treasury_petty_cash), "post" do
    end
  end
end
