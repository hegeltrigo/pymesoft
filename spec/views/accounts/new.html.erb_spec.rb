require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :subdomain => "MyString",
      :owner_id => 1
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input[name=?]", "account[subdomain]"

      assert_select "input[name=?]", "account[owner_id]"
    end
  end
end
