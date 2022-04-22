require 'rails_helper'

RSpec.describe "treasury/petty_cashes/index", type: :view do
  before(:each) do
    assign(:treasury_petty_cashes, [
      Treasury::PettyCash.create!(),
      Treasury::PettyCash.create!()
    ])
  end

  it "renders a list of treasury/petty_cashes" do
    render
  end
end
