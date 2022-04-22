require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :sex => "Sex",
        :number_id => "Number",
        :nationality => "Nationality",
        :living_place => "Living Place",
        :address => "Address",
        :civil_status => "Civil Status",
        :job => "Job",
        :company_name => "Company Name",
        :position => "Position",
        :money_income => "9.99",
        :work_address => "Work Address",
        :working_time => "Working Time",
        :work_phone => "Work Phone"
      ),
      Customer.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :sex => "Sex",
        :number_id => "Number",
        :nationality => "Nationality",
        :living_place => "Living Place",
        :address => "Address",
        :civil_status => "Civil Status",
        :job => "Job",
        :company_name => "Company Name",
        :position => "Position",
        :money_income => "9.99",
        :work_address => "Work Address",
        :working_time => "Working Time",
        :work_phone => "Work Phone"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Nationality".to_s, :count => 2
    assert_select "tr>td", :text => "Living Place".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Civil Status".to_s, :count => 2
    assert_select "tr>td", :text => "Job".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Work Address".to_s, :count => 2
    assert_select "tr>td", :text => "Working Time".to_s, :count => 2
    assert_select "tr>td", :text => "Work Phone".to_s, :count => 2
  end
end
