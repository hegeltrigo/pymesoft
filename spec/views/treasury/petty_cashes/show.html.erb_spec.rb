require 'rails_helper'

RSpec.describe "treasury/petty_cashes/show", type: :view do
  before(:each) do
    @treasury_petty_cash = assign(:treasury_petty_cash, Treasury::PettyCash.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
