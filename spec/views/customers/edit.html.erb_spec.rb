require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :sex => "MyString",
      :number_id => "MyString",
      :nationality => "MyString",
      :living_place => "MyString",
      :address => "MyString",
      :civil_status => "MyString",
      :job => "MyString",
      :company_name => "MyString",
      :position => "MyString",
      :money_income => "9.99",
      :work_address => "MyString",
      :working_time => "MyString",
      :work_phone => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input[name=?]", "customer[first_name]"

      assert_select "input[name=?]", "customer[last_name]"

      assert_select "input[name=?]", "customer[sex]"

      assert_select "input[name=?]", "customer[number_id]"

      assert_select "input[name=?]", "customer[nationality]"

      assert_select "input[name=?]", "customer[living_place]"

      assert_select "input[name=?]", "customer[address]"

      assert_select "input[name=?]", "customer[civil_status]"

      assert_select "input[name=?]", "customer[job]"

      assert_select "input[name=?]", "customer[company_name]"

      assert_select "input[name=?]", "customer[position]"

      assert_select "input[name=?]", "customer[money_income]"

      assert_select "input[name=?]", "customer[work_address]"

      assert_select "input[name=?]", "customer[working_time]"

      assert_select "input[name=?]", "customer[work_phone]"
    end
  end
end
