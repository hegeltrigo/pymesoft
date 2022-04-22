require 'rails_helper'

RSpec.describe "invoice_dosages/index", type: :view do
  before(:each) do
    assign(:invoice_dosages, [
      InvoiceDosage.create!(
        :authorization_number => "Authorization Number",
        :invoice_initial_number => 2,
        :dosage_key => "Dosage Key",
        :economic_activity => "Economic Activity",
        :active => false
      ),
      InvoiceDosage.create!(
        :authorization_number => "Authorization Number",
        :invoice_initial_number => 2,
        :dosage_key => "Dosage Key",
        :economic_activity => "Economic Activity",
        :active => false
      )
    ])
  end

  it "renders a list of invoice_dosages" do
    render
    assert_select "tr>td", :text => "Authorization Number".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Dosage Key".to_s, :count => 2
    assert_select "tr>td", :text => "Economic Activity".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
