require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Nationality/)
    expect(rendered).to match(/Living Place/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Civil Status/)
    expect(rendered).to match(/Job/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Work Address/)
    expect(rendered).to match(/Working Time/)
    expect(rendered).to match(/Work Phone/)
  end
end
