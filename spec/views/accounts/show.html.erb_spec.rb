require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :subdomain => "Subdomain",
      :owner_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subdomain/)
    expect(rendered).to match(/2/)
  end
end
