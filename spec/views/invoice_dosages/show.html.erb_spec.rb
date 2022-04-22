require 'rails_helper'

RSpec.describe "invoice_dosages/show", type: :view do
  before(:each) do
    @invoice_dosage = assign(:invoice_dosage, InvoiceDosage.create!(
      :authorization_number => "Authorization Number",
      :invoice_initial_number => 2,
      :dosage_key => "Dosage Key",
      :economic_activity => "Economic Activity",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Authorization Number/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Dosage Key/)
    expect(rendered).to match(/Economic Activity/)
    expect(rendered).to match(/false/)
  end
end
